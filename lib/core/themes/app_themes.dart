import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

const double inputBorderRadius = 12.0;
const double dialogBorderRadius = 12.0;
const double bottomSheetBorderRadius = 12.0;

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    // useMaterial3: false,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.primary500,
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.secondaryColor,
      error: AppColors.error600,
      onError: AppColors.error600,
      surface: AppColors.white,
      onSurface: AppColors.gray700,
    ),

    fontFamily: AppFont.fontFamily,
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.secondaryColor,
    scaffoldBackgroundColor: AppColors.white,
    shadowColor: AppColors.shadowColor,
    canvasColor: AppColors.surfaceColor,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(dialogBorderRadius),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(bottomSheetBorderRadius),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      titleTextStyle: TextStyle(
        color: AppColors.gray900,
        fontSize: 16,
        fontFamily: AppFont.fontFamily,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: AppColors.gray700,
      ),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(inputBorderRadius),
          ),
          borderSide: BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(inputBorderRadius),
          ),
          borderSide: BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(inputBorderRadius),
          ),
          borderSide: BorderSide(
            color: AppColors.primary700,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(inputBorderRadius),
          ),
          borderSide: BorderSide(
            color: AppColors.error600,
            width: 2,
          ),
        ),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 14,
      ),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(inputBorderRadius),
        ),
        borderSide: BorderSide(
          color: AppColors.borderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(inputBorderRadius),
        ),
        borderSide: BorderSide(
          color: AppColors.primary700,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(inputBorderRadius),
        ),
        borderSide: BorderSide(
          color: AppColors.error600,
          width: 2,
        ),
      ),
      hintStyle: TextStyle(
        color: AppColors.hintColor,
        fontSize: 14,
        fontWeight: FontWeight.w300,
      ),
      prefixIconColor: AppColors.gray300,
      // helperStyle: caption,
      // errorStyle: caption.copyWith(color: AppColors.error600),
      // fillColor: Colors.grey.shade50,
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      // dividerColor: Colors.transparent,
      collapsedShape: RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
      ),
    ),
    sliderTheme: SliderThemeData(
      trackHeight: 4.0,
      thumbColor: AppColors.secondary500,
      activeTrackColor: AppColors.secondary500,
      inactiveTrackColor: AppColors.secondary50,
      disabledActiveTrackColor: Colors.grey.shade300,
      // activeTickMarkColor: ColorManager.primary,
      // overlayShape: SliderComponentShape.noOverlay,
      // thumbShape: const SliderThumbShape(
      //   disabledThumbRadius: 4.0,
      //   enabledThumbRadius: 4.0,
      // ),
      trackShape: const RoundedRectSliderTrackShape(),
      thumbShape: const RoundSliderThumbShape(
        pressedElevation: 8.0,
        enabledThumbRadius: 12.0,
      ),
      showValueIndicator: ShowValueIndicator.always,
      overlayShape: const RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: const RoundSliderTickMarkShape(),
      inactiveTickMarkColor: AppColors.white,
      valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
      // valueIndicatorColor: ColorManager.darkPrimary,
      valueIndicatorTextStyle: const TextStyle(
        color: AppColors.white,
        fontSize: 20.0,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      dividerColor: AppColors.gray100,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primaryColor,
      onPrimary: AppColors.primary500,
      secondary: AppColors.secondaryColor,
      onSecondary: AppColors.secondaryColor,
      error: AppColors.error600,
      onError: AppColors.error600,
      surface: AppColors.gray900,
      onSurface: AppColors.gray200,
    ),
    fontFamily: AppFont.fontFamily,
    primaryColor: AppColors.primaryColor,
    secondaryHeaderColor: AppColors.secondaryColor,
    scaffoldBackgroundColor: AppColors.gray900,
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(dialogBorderRadius),
      ),
      backgroundColor: AppColors.gray800,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: AppColors.gray900,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(bottomSheetBorderRadius),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontFamily: AppFont.fontFamily,
        fontWeight: FontWeight.bold,
        color: AppColors.backgroundColor,
      ),
      iconTheme: IconThemeData(
        color: AppColors.gray50,
      ),
    ),
    dropdownMenuTheme: const DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 14,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(inputBorderRadius),
        ),
        borderSide: BorderSide(
          color: AppColors.borderColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(inputBorderRadius),
        ),
        borderSide: BorderSide(
          color: AppColors.borderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(inputBorderRadius),
        ),
        borderSide: BorderSide(
          color: AppColors.primary700,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(inputBorderRadius),
        ),
        borderSide: BorderSide(
          color: AppColors.error600,
          width: 2,
        ),
      ),
    ),
    expansionTileTheme: const ExpansionTileThemeData(
      collapsedShape: RoundedRectangleBorder(
        side: BorderSide.none,
      ),
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
      ),
    ),
    sliderTheme: const SliderThemeData(
      trackHeight: 4.0,
      thumbColor: AppColors.secondary500,
      activeTrackColor: AppColors.secondary500,
      inactiveTrackColor: AppColors.secondary50,
      disabledActiveTrackColor: AppColors.gray700,
      trackShape: RoundedRectSliderTrackShape(),
      thumbShape: RoundSliderThumbShape(
        pressedElevation: 8.0,
        enabledThumbRadius: 12.0,
      ),
      showValueIndicator: ShowValueIndicator.always,
      overlayShape: RoundSliderOverlayShape(overlayRadius: 24.0),
      tickMarkShape: RoundSliderTickMarkShape(),
      inactiveTickMarkColor: AppColors.white,
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      valueIndicatorTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20.0,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      dividerColor: AppColors.gray100,
    ),
  );
}
