import 'package:flutter/material.dart';

extension XBuildContext on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ElevatedButtonThemeData get elevatedButtonTheme => Theme.of(this).elevatedButtonTheme;

  TextButtonThemeData get textButtonTheme => Theme.of(this).textButtonTheme;

  OutlinedButtonThemeData get outlineButtonTheme => Theme.of(this).outlinedButtonTheme;

  FilledButtonThemeData get filledButtonTheme => Theme.of(this).filledButtonTheme;

  InputDecorationTheme get inputDecorationTheme => Theme.of(this).inputDecorationTheme;

  ShapeBorder? get cardTheme => Theme.of(this).cardTheme.shape;
}

extension ListSpaceBetweenExtension on List<Widget> {
  List<Widget> withSpaceBetween({double? width, double? height}) => [
        for (int i = 0; i < length; i++) ...[
          if (i > 0) SizedBox(width: width, height: height),
          this[i],
        ],
      ];
}

extension HexColor on Color {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  String toHex({bool leadingHashSign = true}) {
    final string = '${leadingHashSign ? '#' : ''}'
        '${alpha.toRadixString(16).padLeft(2, '0')}'
        '${red.toRadixString(16).padLeft(2, '0')}'
        '${green.toRadixString(16).padLeft(2, '0')}'
        '${blue.toRadixString(16).padLeft(2, '0')}';
    return '#${string.substring(3)}';
  }
}
