import 'package:flutter/material.dart';

extension ContextExtensionss on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  EdgeInsets get mediaQueryPadding => mediaQuery.padding;
  EdgeInsets get mediaQueryViewPadding => mediaQuery.viewPadding;
  EdgeInsets get mediaQueryViewInsets => mediaQuery.viewInsets;

  TextScaler get textScaler => mediaQuery.textScaler;

  TextScaler get responsiveTextScaler {
    double unitHeight = isPhone ? 1 : (isPortrait ? height : width) * 0.001;
    return TextScaler.linear(unitHeight);
  }

  // Calculate the scaled text factor using the clamp function to ensure 
  // it stays within a specified range.
  TextScaler get clampTextScaler {
    double unitHeight = isPhone ? 1 : width * 0.001;

    return textScaler.clamp(
      minScaleFactor: 1.0 * unitHeight, // Minimum scale factor allowed.
      maxScaleFactor: 1.3 * unitHeight, // Maximum scale factor allowed.
    );
  }

  Orientation get orientation => mediaQuery.orientation;
  double get devicePixelRatio => mediaQuery.devicePixelRatio;
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait => orientation == Orientation.portrait;

  bool get isPhone => (mediaQueryShortestSide < 600);
  bool get isSmallTablet => (mediaQueryShortestSide >= 600);
  bool get isLargeTablet => (mediaQueryShortestSide >= 720);
  bool get isTablet => isSmallTablet || isLargeTablet;

  Size get mediaQuerySize => mediaQuery.size;
  double get height => mediaQuerySize.height;
  double get width => mediaQuerySize.width;
  double get mediaQueryShortestSide => mediaQuerySize.shortestSide;

  double get topPadding => MediaQueryData.fromView(
        View.of(this),
      ).padding.top;

  double get bottomPadding => MediaQueryData.fromView(
        View.of(this),
      ).padding.bottom;

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  bool get isDark => theme.brightness == Brightness.dark;

  bool get isDarkMode =>
      MediaQuery.platformBrightnessOf(this) == Brightness.dark;
  bool get isLightMode =>
      MediaQuery.platformBrightnessOf(this) == Brightness.dark;

  DefaultTextStyle get defaultTextStyle => DefaultTextStyle.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  ScaffoldState get scaffold => Scaffold.of(this);
  AssetBundle get assetBundle => DefaultAssetBundle.of(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  TextDirection get directionality => Directionality.of(this);

  bool get isRtl => directionality == TextDirection.rtl;

  void unFocusKeyBoard() {
    if (!focusScope.hasPrimaryFocus) focusScope.unfocus();
  }

  void openDrawer() => scaffold.openDrawer();
}
