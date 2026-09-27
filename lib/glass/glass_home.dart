import 'package:fl_clash/common/common.dart';
import 'package:material_ui/material_ui.dart';

import 'desktop_home.dart';
import 'glass_widgets.dart';
import 'mobile_home.dart';

class GlassHome extends StatelessWidget {
  const GlassHome({super.key});

  @override
  Widget build(BuildContext context) {
    if (system.isDesktop) configureGlassForDesktop();
    return system.isDesktop
        ? const DesktopGlassHome()
        : const MobileGlassHome();
  }
}

ThemeData glassTheme(ThemeData base) {
  const scheme = ColorScheme.light(
    primary: Color(0xFF2F7CF6),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFDCE8FF),
    onPrimaryContainer: Color(0xFF0B2A5C),
    secondary: Color(0xFF55627E),
    secondaryContainer: Color(0xFFE3E8F4),
    onSecondaryContainer: Color(0xFF1B2233),
    tertiary: Color(0xFF1FB57F),
    tertiaryContainer: Color(0xFFD5F5E8),
    surface: Color(0xFFF5F7FC),
    surfaceContainerLowest: Color(0xFFFFFFFF),
    surfaceContainerLow: Color(0xFFF9FAFE),
    surfaceContainer: Color(0xFFF0F3FA),
    surfaceContainerHigh: Color(0xFFEAEEF7),
    surfaceContainerHighest: Color(0xFFE3E8F3),
    onSurface: Color(0xFF1B2233),
    onSurfaceVariant: Color(0xFF566079),
    outline: Color(0xFFB4BCCE),
    outlineVariant: Color(0xFFDDE2EC),
  );
  return base.copyWith(
    colorScheme: scheme,
    scaffoldBackgroundColor: scheme.surface,
    canvasColor: scheme.surface,
    cardTheme: base.cardTheme.copyWith(
      color: scheme.surfaceContainerLowest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    dialogTheme: base.dialogTheme.copyWith(
      backgroundColor: scheme.surfaceContainerLowest,
      // A light haze instead of a dark scrim: on the transparent desktop
      // window the barrier would otherwise tint the wallpaper grey.
      barrierColor: const Color(0x66EEF2FA),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
  );
}
