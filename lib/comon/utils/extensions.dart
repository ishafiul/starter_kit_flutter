import 'package:flutter/material.dart';

extension XBuildContext on BuildContext {
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  TextTheme get textTheme => Theme.of(this).textTheme;
  ElevatedButtonThemeData get elevatedButtonTheme => Theme.of(this).elevatedButtonTheme;
  TextButtonThemeData get textButtonTheme => Theme.of(this).textButtonTheme;
  OutlinedButtonThemeData get outlineButtonTheme => Theme.of(this).outlinedButtonTheme;
  InputDecorationTheme get inputDecorationTheme => Theme.of(this).inputDecorationTheme;
  ShapeBorder? get cardTheme => Theme.of(this).cardTheme.shape;
}

extension ListSpaceBetweenExtension on List<Widget> {
  List<Widget> withSpaceBetween({double? width, double? height}) => [
    for (int i = 0; i < length; i++)
      ...[
        if (i > 0)
          SizedBox(width: width, height: height),
        this[i],
      ],
  ];
}