import 'package:fl_clash/common/common.dart';
import 'package:material_ui/material_ui.dart';

import 'desktop_home.dart';
import 'mobile_home.dart';

class GlassHome extends StatelessWidget {
  const GlassHome({super.key});

  @override
  Widget build(BuildContext context) {
    return system.isDesktop
        ? const DesktopGlassHome()
        : const MobileGlassHome();
  }
}

ThemeData glassTheme(ThemeData base) {
  const scheme = ColorScheme.dark(
    primary: Color(0xFF9CD4FF),
    onPrimary: Color(0xFF06223A),
    primaryContainer: Color(0xFF1F3A5C),
    onPrimaryContainer: Color(0xFFD6ECFF),
    secondary: Color(0xFFB7C6E8),
    secondaryContainer: Color(0xFF2A3350),
    onSecondaryContainer: Color(0xFFDDE5FF),
    tertiary: Color(0xFF7CF2C8),
    tertiaryContainer: Color(0xFF1C4A40),
    surface: Color(0xFF0D1122),
    surfaceContainerLowest: Color(0xFF080B17),
    surfaceContainerLow: Color(0xFF11162B),
    surfaceContainer: Color(0xFF151B33),
    surfaceContainerHigh: Color(0xFF1A213D),
    surfaceContainerHighest: Color(0xFF212946),
    onSurface: Color(0xFFE8ECF8),
    onSurfaceVariant: Color(0xFFB4BCD4),
    outline: Color(0xFF4A5372),
    outlineVariant: Color(0xFF2C3450),
  );
  return base.copyWith(
    colorScheme: scheme,
    scaffoldBackgroundColor: scheme.surface,
    canvasColor: scheme.surface,
    cardTheme: base.cardTheme.copyWith(
      color: scheme.surfaceContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    dialogTheme: base.dialogTheme.copyWith(
      backgroundColor: scheme.surfaceContainerHigh,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    ),
  );
}
