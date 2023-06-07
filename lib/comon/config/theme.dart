import 'package:starter_kit_flutter/comon/config/colors.dart';
import 'package:starter_kit_flutter/comon/config/const.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppTheme {
  ThemeData get lightTheme {
    final baseTheme = ThemeData.light();

    final colorScheme = baseTheme.colorScheme.copyWith(
      primary: ArtistaColor.primary,
      onPrimary: Colors.white,
      secondary: ArtistaColor.info,
      onSecondary: Colors.white,
      error: ArtistaColor.danger,
    );

    return baseTheme.copyWith(
      useMaterial3: true,
      colorScheme: colorScheme,
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: Space.xl),
        prefixIconColor: ArtistaColor.disableText.withAlpha(90),
        suffixIconColor: ArtistaColor.disableText.withAlpha(90),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ArtistaColor.primary, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        enabledBorder: UnderlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: BorderSide(color: ArtistaColor.primary.shade50.withAlpha(90), width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        hintStyle: const TextStyle(color: Colors.black26, fontSize: 14),
        fillColor: ArtistaColor.disable,
      ),
      appBarTheme: const AppBarTheme(surfaceTintColor: Colors.white, elevation: 0),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(Colors.black87),
        shape: const CircleBorder(),
      ),
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: ArtistaColor.primary,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: TextStyle(color: ArtistaColor.primary),
          padding: const EdgeInsets.all(6),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
      snackBarTheme: const SnackBarThemeData(
        actionTextColor: Colors.red,
      ),
      dialogBackgroundColor: Colors.white,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: ArtistaColor.disable,
          padding: const EdgeInsets.all(6),
          disabledForegroundColor: ArtistaColor.disableText,
          foregroundColor: ArtistaColor.primary,
          backgroundColor: ArtistaColor.primary.shade50,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          disabledForegroundColor: ArtistaColor.disableText,
          foregroundColor: ArtistaColor.primary,
          padding: const EdgeInsets.all(6),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            side: BorderSide(color: ArtistaColor.primary),
          ),
        ),
      ),
      cardTheme: const CardTheme(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        showUnselectedLabels: false,
        elevation: 0,
        type: BottomNavigationBarType.shifting,
        unselectedLabelStyle: TextStyle(color: ArtistaColor.text),
        selectedLabelStyle: TextStyle(color: ArtistaColor.primary, fontWeight: FontWeight.bold),
        backgroundColor: ArtistaColor.backgroundColor,
        selectedItemColor: ArtistaColor.primary,
        showSelectedLabels: false,
        unselectedItemColor: ArtistaColor.text,
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'regular',
          fontSize: 56,
          color: ArtistaColor.text,
          fontWeight: FontWeight.bold,
          height: 1.24,
        ),
        displayMedium: TextStyle(
          fontFamily: 'regular',
          fontSize: 50,
          color: ArtistaColor.text,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          fontFamily: 'regular',
          fontSize: 40,
          color: ArtistaColor.text,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'regular',
          fontSize: 30,
          color: ArtistaColor.text,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        headlineSmall: TextStyle(
          fontFamily: 'regular',
          fontSize: 24,
          color: ArtistaColor.text,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        titleLarge: TextStyle(
          fontFamily: 'regular',
          fontSize: 20,
          color: ArtistaColor.text,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        titleMedium: TextStyle(
          fontFamily: 'regular',
          fontSize: 18,
          color: ArtistaColor.text,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        titleSmall: TextStyle(
          fontFamily: 'regular',
          fontSize: 16,
          color: ArtistaColor.text,
          fontWeight: FontWeight.w600,
          height: 1.2,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'regular',
          fontSize: 16,
          color: ArtistaColor.text,
          fontWeight: FontWeight.w400,
          height: 1.2,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'regular',
          fontSize: 14,
          color: ArtistaColor.text,
          fontWeight: FontWeight.w400,
          height: 1.2,
        ),
        bodySmall: TextStyle(
          fontFamily: 'regular',
          fontSize: 12,
          color: ArtistaColor.text,
          fontWeight: FontWeight.w400,
          height: 22,
          letterSpacing: 1,
        ),
        labelLarge: TextStyle(
          fontFamily: 'regular',
          fontSize: 16,
          color: ArtistaColor.text,
          fontWeight: FontWeight.w500,
          height: 1.2,
        ),
      ),
      timePickerTheme: TimePickerThemeData(
        dialHandColor: ArtistaColor.secondary,
        hourMinuteColor: ArtistaColor.primary,
        dayPeriodTextColor: ArtistaColor.text,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.secondary,
        extendedSizeConstraints: const BoxConstraints.tightFor(height: 56, width: 280),
      ),
      dialogTheme: const DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Space.md)),
        ),
      ),
      unselectedWidgetColor: ArtistaColor.disableText,
      primaryColor: ArtistaColor.primary,
      radioTheme: RadioThemeData(
        fillColor: MaterialStateProperty.all(ArtistaColor.primary),
      ),
    );
  }
}
