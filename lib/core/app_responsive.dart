import 'package:flutter/material.dart';


class AppResponsive {
  /// Mobile breakpoint
  static const double breakpointMobile = 600;

  /// Tablet breakpoint
  static const double breakpointTablet = 900;

  /// Desktop breakpoint
  static const double breakpointDesktop = 1200;



  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < breakpointMobile;


  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= breakpointMobile &&
          MediaQuery.of(context).size.width < breakpointDesktop;



  static double getResponsiveFontSize(BuildContext context, double baseFontSize) {
    final width = MediaQuery.of(context).size.width;

    if (width < breakpointMobile) {
      return baseFontSize;
    } else if (width < breakpointTablet) {
      return baseFontSize * 1.1;
    } else {
      return baseFontSize * 1.3;
    }
  }

  /// Get responsive value based on screen size
  static T getResponsiveValue<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
  }) {

    if (isTablet(context) && tablet != null) {
      return tablet;
    }

    return mobile;
  }
}