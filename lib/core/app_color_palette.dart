import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  /// Primary
  static const Color primaryLight = Color(0xFF2271E9);
  static const Color primaryDark = Color(0xFFD0BCFF);

  /// Secondary
  static const Color secondaryLight = Color(0xFF2A8DC4);
  static const Color secondaryDark = Color(0xFFCCC2DC);

  /// Background colors
  static const Color backgroundLight = Color(0xFFF6F6F6);
  static const Color backgroundDark = Color(0xFF2271E9);


  /// Get current color based on brightness
  static Color getColor(Color lightColor, Color darkColor, BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light ? lightColor : darkColor;
  }

  /// Get primary color based on current theme
  static Color getPrimary(BuildContext context) =>
      getColor(primaryLight, primaryDark, context);

}