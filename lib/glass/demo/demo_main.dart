import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:fl_clash/enum/enum.dart';
import 'package:fl_clash/l10n/l10n.dart';
import 'package:fl_clash/models/models.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_ui/material_ui.dart';
import 'package:window_manager/window_manager.dart';

import '../desktop_home.dart';
import '../glass_home.dart';
import '../glass_settings.dart';
import '../glass_state.dart';
import '../glass_widgets.dart';
import '../glass_window.dart';
import '../mobile_home.dart';

const _mainGroup = '节点选择';

const _demoNodes = <(String, String, int)>[
  ('🇯🇵 日本 东京 01', 'Trojan', 48),
  ('🇯🇵 日本 东京 02 IPLC', 'Vmess', 36),
  ('🇯🇵 日本 东京 03', 'Shadowsocks', 71),
  ('🇭🇰 香港 01', 'Trojan', 22),
  ('🇭🇰 香港 02 IPLC', 'Vmess', 18),
  ('🇭🇰 香港 03', 'Shadowsocks', 35),
  ('🇸🇬 新加坡 01', 'Trojan', 64),
  ('🇸🇬 新加坡 02', 'Vmess', 59),
  ('🇺🇸 美国 洛杉矶 01', 'Trojan', 152),
  ('🇺🇸 美国 洛杉矶 02', 'Vmess', 168),
  ('🇬🇧 英国 伦敦 01', 'Trojan', 214),
  ('🇩🇪 德国 法兰克福 01', 'Vmess', 236),
  ('🇹🇼 台湾 台北 01', 'Trojan', 41),
  ('🇹🇼 台湾 台北 02', 'Hysteria2', 53),
];

List<Group> _demoGroups() {
  final leaves = [
    for (final (name, type, _) in _demoNodes) Proxy(name: name, type: type),
  ];
  return [
    Group(
      type: GroupType.Selector,
      name: _mainGroup,
      all: [
        const Proxy(name: '自动选择', type: 'URLTest'),
        const Proxy(name: '剩余流量：113.5 GB', type: 'Direct'),
        const Proxy(name: '套餐到期：2026-12-31', type: 'Direct'),
        ...leaves,
      ],
      now: '🇯🇵 日本 东京 02 IPLC',
    ),
    Group(
      type: GroupType.URLTest,
      name: '自动选择',
      all: leaves,
      now: '🇭🇰 香港 02 IPLC',
    ),
    const Group(
      type: GroupType.Selector,
      name: 'GLOBAL',
      hidden: true,
      all: [Proxy(name: _mainGroup, type: 'Selector')],
    ),
  ];
}

class _DemoBackend implements GlassBackend {
  _DemoBackend(this.container);

  final ProviderContainer Function() container;

  @override
  Future<void> applyNode(GlassNode node) async {}

  @override
  void changeMode(Mode mode) {}

  @override
  int? delayOf(String name, String? testUrl) =>
      _demoNodes.where((n) => n.$1 == name).map((n) => n.$3).firstOrNull;

  @override
  void refreshGroups() {}

  @override
  void setTun(bool value) {}

  @override
  Future<void> testNodes(List<String> names, String? testUrl) async {}

  @override
  void toggleRunning() {}
}

class _Scene {
  const _Scene(this.name, this.size, this.builder, {this.phone = false});

  final String name;
  final Size size;
  final Widget Function() builder;
  final bool phone;
}

final _scenes = <String, _Scene>{
  'desktop_collapsed': _Scene(
    'desktop_collapsed',
    const Size(860, 400),
    () => const _DesktopStage(
      height: glassWidgetHeight,
      child: DesktopGlassHome(),
    ),
  ),
  'desktop_map': _Scene(
    'desktop_map',
    const Size(860, 840),
    () => const _DesktopStage(
      height: glassMapHeight,
      child: DesktopGlassHome(initialPanel: DesktopPanel.map),
    ),
  ),
  'desktop_settings': _Scene(
    'desktop_settings',
    const Size(860, 860),
    () => const _DesktopStage(
      height: glassSettingsHeight,
      child: DesktopGlassHome(initialPanel: DesktopPanel.settings),
    ),
  ),
  'mobile_main': _Scene(
    'mobile_main',
    const Size(390, 844),
    () => const MobileGlassHome(),
    phone: true,
  ),
  'mobile_switch': _Scene(
    'mobile_switch',
    const Size(390, 844),
    () => const MobileGlassHome(initialSwitching: true),
    phone: true,
  ),
  'mobile_settings': _Scene(
    'mobile_settings',
    const Size(390, 844),
    () => const GlassSettingsPage(),
    phone: true,
  ),
};

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  glassDemoMode = true;
  String arg(String key, String fallback) {
    for (final a in args) {
      if (a.startsWith('--$key=')) return a.substring(key.length + 3);
    }
    return Platform.environment['GLASS_${key.toUpperCase()}'] ?? fallback;
  }

  final scene = _scenes[arg('scene', 'desktop_map')]!;
  glassMobileLayout = scene.phone;
  if (!scene.phone) configureGlassForDesktop();
  final locale = arg('locale', 'zh_CN');
  final out = arg('out', '');
  final delayMs = int.parse(arg('delay', '1800'));
  const profile = Profile(
    id: 1,
    label: 'Nebula Cloud · 月付 200G',
    url: 'https://example.com/api/v1/client/subscribe?token=demo',
    autoUpdateDuration: Duration(days: 1),
    subscriptionInfo: SubscriptionInfo(
      upload: 9 * 1024 * 1024 * 1024,
      download: 77 * 1024 * 1024 * 1024,
      total: 200 * 1024 * 1024 * 1024,
      expire: 1798646400,
    ),
    selectedMap: {_mainGroup: '🇯🇵 日本 东京 02 IPLC'},
  );
  late ProviderContainer container;
  container = ProviderContainer(
    overrides: [
      groupsProvider.overrideWithBuild((_, _) => _demoGroups()),
      glassSelectedMapProvider.overrideWithValue(profile.selectedMap),
      runTimeProvider.overrideWithBuild((_, _) => 3723000),
      glassSpeedProvider.overrideWithValue(
        const Traffic(up: 1580000, down: 23460000),
      ),
      currentProfileProvider.overrideWithValue(profile),
      profilesProvider.overrideWithBuild((_, _) => [profile]),
      glassDelayProvider.overrideWith((ref, args) {
        return _demoNodes
            .where((n) => n.$1 == args.$1)
            .map((n) => n.$3)
            .firstOrNull;
      }),
      glassTunProvider.overrideWithValue(true),
      glassBackendProvider.overrideWithValue(_DemoBackend(() => container)),
    ],
  );
  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    await windowManager.ensureInitialized();
    await windowManager.waitUntilReadyToShow(
      WindowOptions(size: Size(scene.size.width + 40, scene.size.height + 40)),
      () async {
        await windowManager.show();
      },
    );
  }
  final boundary = GlobalKey();
  final parts = locale.split('_');
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: Locale(parts.first, parts.length > 1 ? parts[1] : null),
        supportedLocales: AppLocalizations.delegate.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        theme: glassTheme(
          ThemeData(useMaterial3: true, brightness: Brightness.light),
        ),
        home: Align(
          alignment: Alignment.topLeft,
          child: RepaintBoundary(
            key: boundary,
            child: SizedBox.fromSize(
              size: scene.size,
              child: scene.phone
                  ? _PhoneStage(child: scene.builder())
                  : scene.builder(),
            ),
          ),
        ),
      ),
    ),
  );
  if (out.isEmpty) return;
  await Future<void>.delayed(Duration(milliseconds: delayMs));
  await WidgetsBinding.instance.endOfFrame;
  final render =
      boundary.currentContext!.findRenderObject()! as RenderRepaintBoundary;
  final image = await render.toImage(pixelRatio: 2);
  final bytes = await image.toByteData(format: ui.ImageByteFormat.png);
  await File(out).writeAsBytes(bytes!.buffer.asUint8List());
  exit(0);
}

class _PhoneStage extends StatelessWidget {
  const _PhoneStage({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).copyWith(
      size: const Size(390, 844),
      padding: const EdgeInsets.only(top: 47, bottom: 34),
      viewPadding: const EdgeInsets.only(top: 47, bottom: 34),
    );
    return MediaQuery(
      data: media,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(child: child),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 47,
            child: Material(
              type: MaterialType.transparency,
              child: _StatusBar(),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusBar extends StatelessWidget {
  const _StatusBar();

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(
      color: GlassColors.text,
      fontSize: 15,
      fontWeight: FontWeight.w600,
    );
    return const Padding(
      padding: EdgeInsets.fromLTRB(30, 14, 26, 0),
      child: Row(
        children: [
          Text('9:41', style: style),
          Spacer(),
          Icon(
            Icons.signal_cellular_alt_rounded,
            color: GlassColors.text,
            size: 17,
          ),
          SizedBox(width: 5),
          Icon(Icons.wifi_rounded, color: GlassColors.text, size: 17),
          SizedBox(width: 5),
          Icon(Icons.vpn_key_rounded, color: GlassColors.text, size: 14),
          SizedBox(width: 6),
          Icon(Icons.battery_full_rounded, color: GlassColors.text, size: 18),
        ],
      ),
    );
  }
}

/// Fake desktop wallpaper so the simulated acrylic has something to frost.
class _DesktopStage extends StatelessWidget {
  const _DesktopStage({required this.height, required this.child});

  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: CustomPaint(painter: _WallpaperPainter())),
        Positioned(
          left: 110,
          top: 60,
          width: glassWidgetWidth,
          height: height,
          child: child,
        ),
      ],
    );
  }
}

class _WallpaperPainter extends CustomPainter {
  const _WallpaperPainter();

  static final bool _dark = Platform.environment['GLASS_WALLPAPER'] == 'dark';

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    canvas.drawRect(
      rect,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: _dark
              ? const [Color(0xFF1B1446), Color(0xFF0B1D3A), Color(0xFF071019)]
              : const [Color(0xFFE3ECFA), Color(0xFFBCD0F2), Color(0xFF93AEE3)],
        ).createShader(rect),
    );
    void blob(Offset c, double r, Color color) {
      canvas.drawCircle(
        c,
        r,
        Paint()
          ..shader = RadialGradient(
            colors: [color, color.withValues(alpha: 0)],
          ).createShader(Rect.fromCircle(center: c, radius: r)),
      );
    }

    if (_dark) {
      blob(
        Offset(size.width * 0.18, size.height * 0.2),
        260,
        const Color(0xFFFF6A88),
      );
      blob(
        Offset(size.width * 0.72, size.height * 0.12),
        240,
        const Color(0xFF6A7BFF),
      );
      blob(
        Offset(size.width * 0.86, size.height * 0.62),
        300,
        const Color(0xFF22D3C5),
      );
      blob(
        Offset(size.width * 0.32, size.height * 0.8),
        280,
        const Color(0xFFFFA24C),
      );
    } else {
      // Loosely modelled on the Windows 11 "Bloom" wallpaper.
      final c = Offset(size.width * 0.62, size.height * 0.58);
      for (var i = 0; i < 7; i++) {
        final angle = -math.pi / 2 + (i - 3) * 0.42;
        final petal = c + Offset(math.cos(angle), math.sin(angle)) * 150;
        blob(petal, 230, const Color(0xFF2F6BE0).withValues(alpha: 0.55));
      }
      blob(c, 220, const Color(0xFF1C4FC4).withValues(alpha: 0.7));
      blob(
        Offset(size.width * 0.1, size.height * 0.15),
        260,
        const Color(0xFFFFFFFF),
      );
      blob(
        Offset(size.width * 0.2, size.height * 0.9),
        240,
        const Color(0xFFF6C7E4),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
