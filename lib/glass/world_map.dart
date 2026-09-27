import 'dart:convert';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:material_ui/material_ui.dart';

import 'glass_widgets.dart';
import 'region.dart';
import 'world_dots.dart';

class _DotGrid {
  _DotGrid._(this.cols, this.rows, this.codes, this.data);

  factory _DotGrid.decode() {
    final bytes = base64Decode(worldDotData);
    final count = bytes.length ~/ 3;
    final cols = Uint8List(count);
    final rows = Uint8List(count);
    final codes = Uint8List(count);
    for (var i = 0; i < count; i++) {
      cols[i] = bytes[i * 3];
      rows[i] = bytes[i * 3 + 1];
      codes[i] = bytes[i * 3 + 2];
    }
    return _DotGrid._(cols, rows, codes, bytes);
  }

  final Uint8List cols;
  final Uint8List rows;
  final Uint8List codes;
  final Uint8List data;

  int get length => cols.length;

  static final _DotGrid instance = _DotGrid.decode();
}

const _mapLonSpan = 360.0;
const double _mapLatSpan = worldDotRows * worldDotStep;
const double mapAspectRatio = _mapLonSpan / _mapLatSpan;

class WorldMapMarker {
  const WorldMapMarker({required this.key, required this.count});

  final RegionKey key;
  final int count;
}

/// Dot-matrix world map: every country is dim, supported regions glow white.
class WorldDotMap extends StatefulWidget {
  const WorldDotMap({
    super.key,
    required this.markers,
    this.selected,
    this.onSelect,
    this.interactive = true,
  });

  final List<WorldMapMarker> markers;
  final RegionKey? selected;
  final ValueChanged<RegionKey>? onSelect;
  final bool interactive;

  @override
  State<WorldDotMap> createState() => _WorldDotMapState();
}

class _WorldDotMapState extends State<WorldDotMap>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2400),
  )..repeat();

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  Rect _mapRect(Size size) {
    var w = size.width;
    var h = w / mapAspectRatio;
    if (h > size.height) {
      h = size.height;
      w = h * mapAspectRatio;
    }
    return Rect.fromLTWH((size.width - w) / 2, (size.height - h) / 2, w, h);
  }

  void _handleTap(Offset position, Size size) {
    final onSelect = widget.onSelect;
    if (onSelect == null || widget.markers.isEmpty) return;
    final rect = _mapRect(size);
    WorldMapMarker? best;
    var bestDistance = double.infinity;
    for (final marker in widget.markers) {
      final p = projectLatLon(rect, marker.key.lat, marker.key.lon);
      final d = (p - position).distance;
      if (d < bestDistance) {
        bestDistance = d;
        best = marker;
      }
    }
    final threshold = math.max(26.0, rect.width * 0.045);
    if (best != null && bestDistance <= threshold) {
      onSelect(best.key);
      return;
    }
    final grid = _DotGrid.instance;
    final cell = rect.width / worldDotCols;
    final supported = {for (final m in widget.markers) m.key.country};
    String? hitCountry;
    var hitDistance = double.infinity;
    for (var i = 0; i < grid.length; i++) {
      final p = _dotOffset(rect, grid.cols[i], grid.rows[i]);
      final d = (p - position).distance;
      if (d < cell * 1.2 && d < hitDistance) {
        final code = worldDotCodes[grid.codes[i]];
        if (supported.contains(code)) {
          hitDistance = d;
          hitCountry = code;
        }
      }
    }
    if (hitCountry != null) {
      final candidates =
          widget.markers.where((m) => m.key.country == hitCountry).toList()
            ..sort((a, b) {
              final da = (projectLatLon(rect, a.key.lat, a.key.lon) - position)
                  .distance;
              final db = (projectLatLon(rect, b.key.lat, b.key.lon) - position)
                  .distance;
              return da.compareTo(db);
            });
      onSelect(candidates.first.key);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTapUp: widget.interactive
              ? (d) => _handleTap(d.localPosition, size)
              : null,
          child: RepaintBoundary(
            child: CustomPaint(
              size: size,
              painter: _WorldMapPainter(
                markers: widget.markers,
                selected: widget.selected,
                pulse: _pulse,
                rectFor: _mapRect,
              ),
            ),
          ),
        );
      },
    );
  }
}

Offset projectLatLon(Rect rect, double lat, double lon) {
  final x = (lon - worldDotLon0) / _mapLonSpan * rect.width;
  final y = (worldDotLat0 - lat + worldDotStep / 2) / _mapLatSpan * rect.height;
  return rect.topLeft + Offset(x, y);
}

Offset _dotOffset(Rect rect, int col, int row) {
  final lon =
      worldDotLon0 +
      col * worldDotStep +
      (row.isOdd ? worldDotStep / 2 : 0) +
      worldDotStep / 4;
  final lat = worldDotLat0 - row * worldDotStep;
  return projectLatLon(rect, lat, lon);
}

class _WorldMapPainter extends CustomPainter {
  _WorldMapPainter({
    required this.markers,
    required this.selected,
    required this.pulse,
    required this.rectFor,
  }) : super(repaint: pulse);

  final List<WorldMapMarker> markers;
  final RegionKey? selected;
  final Animation<double> pulse;
  final Rect Function(Size size) rectFor;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = rectFor(size);
    final grid = _DotGrid.instance;
    final cell = rect.width / worldDotCols;
    final supported = {for (final m in markers) m.key.country};
    final selectedCountry = selected?.country;
    final dim = <Offset>[];
    final lit = <Offset>[];
    final hot = <Offset>[];
    for (var i = 0; i < grid.length; i++) {
      final code = worldDotCodes[grid.codes[i]];
      final p = _dotOffset(rect, grid.cols[i], grid.rows[i]);
      if (code == selectedCountry) {
        hot.add(p);
      } else if (supported.contains(code)) {
        lit.add(p);
      } else {
        dim.add(p);
      }
    }
    final dotSize = math.max(1.4, cell * 0.52);
    Paint dots(Color color, double strokeWidth, [double blur = 0]) {
      final paint = Paint()
        ..color = color
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;
      if (blur > 0) {
        paint.maskFilter = MaskFilter.blur(BlurStyle.normal, blur);
      }
      return paint;
    }

    canvas.drawPoints(
      ui.PointMode.points,
      dim,
      dots(const Color(0xFF5B6B8C).withValues(alpha: 0.2), dotSize),
    );
    if (lit.isNotEmpty) {
      canvas.drawPoints(
        ui.PointMode.points,
        lit,
        dots(
          GlassColors.glow.withValues(alpha: 0.55),
          dotSize * 2.4,
          dotSize * 1.3,
        ),
      );
      canvas.drawPoints(
        ui.PointMode.points,
        lit,
        dots(Colors.white, dotSize * 1.05),
      );
    }
    if (hot.isNotEmpty) {
      canvas.drawPoints(
        ui.PointMode.points,
        hot,
        dots(
          GlassColors.accent.withValues(alpha: 0.6),
          dotSize * 2.8,
          dotSize * 1.6,
        ),
      );
      canvas.drawPoints(
        ui.PointMode.points,
        hot,
        dots(Colors.white, dotSize * 1.05),
      );
    }

    final t = pulse.value;
    for (final marker in markers) {
      final isSelected = marker.key == selected;
      final p = projectLatLon(rect, marker.key.lat, marker.key.lon);
      final base = math.max(2.6, cell * (isSelected ? 1.05 : 0.8));
      canvas.drawCircle(
        p,
        base * 3.2,
        Paint()
          ..color = (isSelected ? GlassColors.accent : GlassColors.glow)
              .withValues(alpha: isSelected ? 0.7 : 0.75)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, base * 2.2),
      );
      canvas.drawCircle(p, base, Paint()..color = Colors.white);
      canvas.drawCircle(
        p,
        base + 0.6,
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1
          ..color = (isSelected ? GlassColors.accent : GlassColors.glow)
              .withValues(alpha: 0.9),
      );
      if (isSelected) {
        for (final phase in [0.0, 0.5]) {
          final k = (t + phase) % 1.0;
          canvas.drawCircle(
            p,
            base * (1.6 + k * 5.5),
            Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.3
              ..color = GlassColors.accent.withValues(alpha: (1 - k) * 0.6),
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(_WorldMapPainter oldDelegate) =>
      oldDelegate.markers != markers || oldDelegate.selected != selected;
}
