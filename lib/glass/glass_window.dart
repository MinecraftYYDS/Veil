import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter_acrylic/flutter_acrylic.dart' as acrylic;
import 'package:material_ui/material_ui.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

import 'glass_widgets.dart';

const glassWidgetWidth = 640.0;
const glassWidgetHeight = 180.0;
const glassMapHeight = 622.0;
const glassSettingsHeight = 648.0;
const _alwaysOnTopKey = 'glass.alwaysOnTop';

/// Set by the screenshot harness: paints a fake desktop and simulated acrylic.
bool glassDemoMode = false;

/// Forces the Android layout decisions (used by the harness on desktop hosts).
bool glassMobileLayout = false;

enum GlassWindowMaterial { acrylic, transparent, none }

class GlassWindow {
  GlassWindow._();

  static GlassWindowMaterial material = GlassWindowMaterial.none;
  static final ValueNotifier<bool> alwaysOnTop = ValueNotifier(false);
  static double _height = glassWidgetHeight;
  static double _desired = glassWidgetHeight;
  static int _overlays = 0;
  static int _resizeToken = 0;
  static const _overlayMinHeight = 560.0;

  static void overlayPushed() {
    _overlays++;
    if (_height < _overlayMinHeight) unawaited(_animateTo(_overlayMinHeight));
  }

  static void overlayPopped() {
    if (_overlays == 0) return;
    _overlays--;
    if (_overlays == 0) unawaited(_animateTo(_desired));
  }

  static bool get _isWin11 {
    if (!Platform.isWindows) return false;
    final match = RegExp(
      r'Build (\d+)',
    ).firstMatch(Platform.operatingSystemVersion);
    final build = int.tryParse(match?.group(1) ?? '') ?? 0;
    return build >= 22000;
  }

  static Future<void> init() async {
    if (glassDemoMode) return;
    try {
      await windowManager.setAsFrameless();
      await windowManager.setBackgroundColor(Colors.transparent);
      await windowManager.setHasShadow(true);
      await windowManager.setResizable(false);
      await windowManager.setMaximizable(false);
      await windowManager.setMinimumSize(
        const Size(glassWidgetWidth, glassWidgetHeight),
      );
      await windowManager.setSize(
        const Size(glassWidgetWidth, glassWidgetHeight),
      );
    } catch (_) {}
    if (Platform.isWindows) {
      try {
        await acrylic.Window.initialize();
        if (_isWin11) {
          await acrylic.Window.setEffect(
            effect: acrylic.WindowEffect.acrylic,
            color: const Color(0x55101426),
            dark: true,
          );
          await windowManager.setWindowCornerPreference(round: true);
          material = GlassWindowMaterial.acrylic;
        } else {
          await acrylic.Window.setEffect(
            effect: acrylic.WindowEffect.transparent,
            color: Colors.transparent,
          );
          material = GlassWindowMaterial.transparent;
        }
      } catch (_) {
        material = GlassWindowMaterial.none;
      }
    }
    try {
      final prefs = await SharedPreferences.getInstance();
      final onTop = prefs.getBool(_alwaysOnTopKey) ?? false;
      alwaysOnTop.value = onTop;
      if (onTop) await windowManager.setAlwaysOnTop(true);
    } catch (_) {}
  }

  static Future<void> setAlwaysOnTop(bool value) async {
    alwaysOnTop.value = value;
    if (glassDemoMode) return;
    try {
      await windowManager.setAlwaysOnTop(value);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_alwaysOnTopKey, value);
    } catch (_) {}
  }

  static Future<void> startDragging() async {
    if (glassDemoMode) return;
    try {
      await windowManager.startDragging();
    } catch (_) {}
  }

  /// Grows or shrinks the window from its top edge, keeping it on screen.
  static Future<void> animateHeight(double target) {
    _desired = target;
    if (_overlays > 0 && target < _overlayMinHeight) {
      target = _overlayMinHeight;
    }
    return _animateTo(target);
  }

  static Future<void> _animateTo(
    double target, {
    Duration duration = const Duration(milliseconds: 240),
  }) async {
    if (glassDemoMode) {
      _height = target;
      return;
    }
    final token = ++_resizeToken;
    final start = _height;
    if ((target - start).abs() < 1) return;
    try {
      if (target > start) await _ensureRoomBelow(target);
      const steps = 12;
      for (var i = 1; i <= steps; i++) {
        if (token != _resizeToken) return;
        final t = Curves.easeOutCubic.transform(i / steps);
        final h = ui.lerpDouble(start, target, t)!;
        await windowManager.setSize(Size(glassWidgetWidth, h.roundToDouble()));
        _height = h;
        await Future<void>.delayed(
          Duration(milliseconds: duration.inMilliseconds ~/ steps),
        );
      }
      _height = target;
    } catch (_) {
      _height = target;
    }
  }

  static Future<void> _ensureRoomBelow(double target) async {
    final bounds = await windowManager.getBounds();
    final displays = await screenRetriever.getAllDisplays();
    for (final display in displays) {
      final origin = display.visiblePosition ?? Offset.zero;
      final size = display.visibleSize ?? display.size;
      final area = origin & size;
      if (area.contains(bounds.topLeft + const Offset(4, 4))) {
        final overflow = bounds.top + target - area.bottom;
        if (overflow > 0) {
          final top = (bounds.top - overflow).clamp(area.top, double.infinity);
          await windowManager.setPosition(Offset(bounds.left, top.toDouble()));
        }
        return;
      }
    }
  }
}

/// The window's own glass: real acrylic on Windows 11, painted glass elsewhere.
class GlassWindowFrame extends StatelessWidget {
  const GlassWindowFrame({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final material = GlassWindow.material;
    final radius = material == GlassWindowMaterial.acrylic ? 8.0 : 26.0;
    final borderRadius = BorderRadius.circular(radius);
    final Widget fill;
    if (glassDemoMode) {
      fill = BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 34, sigmaY: 34),
        child: const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0x661A2040), Color(0x8C0A0D1C)],
            ),
          ),
        ),
      );
    } else if (material == GlassWindowMaterial.acrylic) {
      fill = const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0x40182040), Color(0x800A0D1C)],
          ),
        ),
      );
    } else {
      fill = const DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xF01A2040), Color(0xF50A0D1C)],
          ),
        ),
      );
    }
    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        fit: StackFit.expand,
        children: [
          fill,
          if (material != GlassWindowMaterial.acrylic || glassDemoMode)
            const GlassBackground(opacity: 0.35),
          CustomPaint(
            foregroundPainter: GlassRimPainter(radius: radius, strength: 0.9),
            child: child,
          ),
        ],
      ),
    );
  }
}

/// Grows the collapsed widget while a dialog or sheet is up so it has room.
class GlassDialogObserver extends NavigatorObserver {
  bool _isOverlay(Route<dynamic>? route) => route is PopupRoute;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (_isOverlay(route)) GlassWindow.overlayPushed();
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (_isOverlay(route)) GlassWindow.overlayPopped();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (_isOverlay(route)) GlassWindow.overlayPopped();
  }
}
