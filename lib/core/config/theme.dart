import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:starter_kit_flutter/core/config/colors.dart';
import 'package:starter_kit_flutter/core/const.dart';

/// a [Singleton] class that hold our project theming info
@singleton
class AppTheme {
  /// getter for light theme
  ThemeData get lightTheme {
    final baseTheme = ThemeData.light();

    final colorScheme = baseTheme.colorScheme.copyWith(
      primary: CColor.primary,
      onPrimary: Colors.white,
      secondary: CColor.info,
      background: CColor.backgroundColor,
      onSecondary: Colors.white,
      error: CColor.danger,
      surfaceTint: Colors.white,
    );

    return baseTheme.copyWith(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: const Color(0xffFAFAFA),
      inputDecorationTheme: InputDecorationTheme(
        counterStyle: TextStyle(
          color: const Color(0xff71727A),
          fontSize: 14.r,
          fontWeight: FontWeight.w300,
        ),
        labelStyle: TextStyle(color: Colors.black, fontSize: 14.r),
        contentPadding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
        prefixIconColor: const Color(0xff6C7E8B),
        suffixIconColor: const Color(0xff6C7E8B),
        filled: true,
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: CColor.primary),
          borderRadius: BorderRadius.all(Radius.circular(Space.lg.r)),
        ),
        enabledBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Color(0xffC5C6CC)),
          borderRadius: BorderRadius.all(Radius.circular(Space.lg.r)),
        ),
        errorBorder: OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: BorderSide(color: CColor.danger),
          borderRadius: BorderRadius.all(Radius.circular(Space.lg.r)),
        ),
        hintStyle: TextStyle(
          color: const Color(0xffBEBEBE),
          fontSize: 14.r,
          height: 1.42.h,
        ),
        fillColor: Colors.white,
        suffixStyle: TextStyle(
          fontSize: 16.r,
        ),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        shape: Border.all(color: Colors.transparent),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xffFAFAFA),
        elevation: 0,
        toolbarHeight: 56.h,
        titleSpacing: 16.w,
        shadowColor: Colors.black.withAlpha(0),
        // systemOverlayStyle: const SystemUiOverlayStyle(
        //   statusBarColor: Colors.transparent,
        //   statusBarIconBrightness: Brightness.dark,
        // ),
      ),
      tabBarTheme: TabBarTheme(
        indicatorColor: CColor.primary.shade800,
        indicatorSize: TabBarIndicatorSize.tab,
        tabAlignment: TabAlignment.start,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400),
        unselectedLabelColor: CColor.disableText,
        labelStyle: TextStyle(
          color: CColor.primary.shade800,
          fontWeight: FontWeight.w500,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.white),
        checkColor: MaterialStateProperty.all(CColor.primary),
        side: BorderSide(
          color: CColor.primary,
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: CColor.primary,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(color: CColor.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(buttonBorderRadius.r),
            ),
          ),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        actionTextColor: Colors.red,
      ),
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: Colors.white,
        dayOverlayColor: MaterialStatePropertyAll(Colors.white),
      ),
      dialogBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          disabledBackgroundColor: CColor.disable,
          disabledForegroundColor: Colors.white,
          foregroundColor: CColor.primary,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(buttonBorderRadius.r),
            ),
          ),
        ),
      ),
      iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(iconSize: MaterialStatePropertyAll(24.r))),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          disabledForegroundColor: CColor.disableText,
          foregroundColor: CColor.primary,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(buttonBorderRadius.r),
            ),
            side: BorderSide(color: CColor.primary),
          ),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          disabledBackgroundColor: CColor.disable,
          disabledForegroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(buttonBorderRadius.r),
            ),
          ),
        ),
      ),
      cardTheme: CardTheme(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.r),
          ),
        ),
        color: Colors.white,
        shadowColor: CColor.disableText.withOpacity(0.05),
      ),
      dividerTheme: const DividerThemeData(
        color: CColor.disableText,
        thickness: 1.0,
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: Colors.transparent),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: false,
        elevation: 0,
        type: BottomNavigationBarType.shifting,
        unselectedLabelStyle: TextStyle(color: CColor.text),
        selectedLabelStyle:
            TextStyle(color: CColor.primary, fontWeight: FontWeight.bold),
        backgroundColor: CColor.backgroundColor,
        selectedItemColor: CColor.primary,
        showSelectedLabels: false,
        unselectedItemColor: CColor.text,
      ),
      sliderTheme: const SliderThemeData(
        showValueIndicator: ShowValueIndicator.always,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 57.r,
          color: CColor.text,
          fontFamily: 'Inter',
        ),
        displayMedium: TextStyle(
          fontSize: 45.r,
          color: CColor.text,
          fontFamily: 'Inter',
        ),
        displaySmall: TextStyle(
          fontSize: 36.r,
          color: CColor.text,
          fontFamily: 'Inter',
        ),
        headlineLarge: TextStyle(
          fontSize: 32.r,
          color: CColor.text,
          fontFamily: 'Inter',
        ),
        headlineMedium: TextStyle(
          fontSize: 28.r,
          color: CColor.text,
          fontFamily: 'Inter',
        ),
        headlineSmall: TextStyle(
          fontSize: 24.r,
          color: CColor.text,
          fontFamily: 'Inter',
        ),
        titleLarge: TextStyle(
          fontSize: 20.r,
          color: CColor.text,
          fontFamily: 'Inter',
        ),
        titleMedium: TextStyle(
          fontSize: 22.r,
          color: CColor.text,
          fontFamily: 'Inter',
        ),
        titleSmall: TextStyle(
          fontSize: 16.r,
          color: CColor.text,
          fontFamily: 'Inter',
        ),
        bodyLarge: TextStyle(
          fontSize: 16.r,
          color: CColor.text,
          fontFamily: 'Inter',
        ),
        bodyMedium: TextStyle(
          fontSize: 14.r,
          color: CColor.text,
          fontFamily: 'Inter',
        ),
        bodySmall: TextStyle(
          fontSize: 12.r,
          color: CColor.text,
          fontFamily: 'Inter',
        ),
        labelLarge:
            TextStyle(fontSize: 14.r, color: CColor.text, fontFamily: 'Inter'),
        labelMedium:
            TextStyle(fontSize: 12.r, color: CColor.text, fontFamily: 'Inter'),
        labelSmall: TextStyle(
          fontSize: 11.r,
          color: CColor.text,
          letterSpacing: 0,
          fontFamily: 'Inter',
        ),
      ),
      timePickerTheme: TimePickerThemeData(
        dayPeriodColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? CColor.primary
              : Colors.white,
        ),
        dayPeriodTextColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? CColor.primary.shade50
              : const Color(0xffbebebe),
        ),
        dialBackgroundColor: CColor.primary.shade50,
        dialTextColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? CColor.primary.shade50
              : CColor.primary,
        ),
        hourMinuteColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? CColor.primary
              : CColor.primary.shade50,
        ),
        hourMinuteTextColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.selected)
              ? CColor.primary.shade50
              : CColor.primary.shade100,
        ),
        dayPeriodBorderSide: const BorderSide(color: Color(0xffbebebe)),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.secondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
        ),
        extendedSizeConstraints:
            const BoxConstraints.tightFor(height: 56, width: 280),
      ),
      dialogTheme: const DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Space.md)),
        ),
      ),
      unselectedWidgetColor: CColor.disableText,
      primaryColor: CColor.primary,
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(CColor.primary),
      ),
    );
  }
}
