import 'package:flutter/material.dart';

/// this function will generate color shades and tints from a solid color
/// and will retun [MaterialColor]. so that we can use any color as material color
/// property. from a solid color it will generate `shade100` to `shade900`.and `shade500`
/// will be base color.
MaterialColor createMaterialColor(Color color) {
  final List<double> strengths = <double>[.5];
  final swatch = <int, Color>{};
  final r = color.red;
  final g = color.green;
  final b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (final strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

/// project colors
class CColor {
  /// primary color for a project that can be use as a [ColorScheme] inside material
  /// theme property.
  static MaterialColor primary = createMaterialColor(const Color(0xFF00A0E8));

  /// warning color for a project that can be use as a [ColorScheme] inside material
  /// theme property. or use can use for any warning related color.
  static MaterialColor warning = createMaterialColor(const Color(0xFFF39F1D));

  /// danger color for a project that can be use as a [ColorScheme] inside material
  /// theme property. or use can use for any danger related color.
  static MaterialColor danger = createMaterialColor(const Color(0xFFD40022));

  /// success color for a project that can be use as a [ColorScheme] inside material
  /// theme property. or use can use for any success related color.
  static MaterialColor success = createMaterialColor(const Color(0xFF37AD57));

  /// info color for a project that can be use as a [ColorScheme] inside material
  /// theme property. or use can use for any info related color.
  static MaterialColor info = createMaterialColor(const Color(0xFF0758CE));

  /// disable color for a project that can be use as a [ColorScheme] inside material
  /// theme property. or use can use for any disable related color.
  static MaterialColor disable = createMaterialColor(const Color(0xFFBEBEBE));

  /// secondary color for a project that can be use as a [ColorScheme] inside material
  /// theme property. or use can use for any secondary related color.
  static MaterialColor secondary = createMaterialColor(const Color(0xFFFF752D));

  /// text colors
  static MaterialColor text = createMaterialColor(const Color(0xFF2D2D2D));

  /// backgroundColor for projects
  static const backgroundColor = Colors.white;

  /// disableText for projects
  static const disableText = Color(0xFF838699);

  /// just another info shade
  static const infoShade20 = Color(0xFFCEE6FC);

  /// gradiant 1
  static const brandGra1 = LinearGradient(
    begin: Alignment.centerRight,
    end: Alignment.centerLeft,
    colors: [Color(0xff0b63e5), Color(0xff00a0e8)],
  );

  /// project colors that will retun all color property as static variabble
  CColor();
}

/// get [InverseBW] color
class InverseBW {
  double _calculateLuminance(List<int> rgb) {
    return 0.2126 * rgb[0] + 0.7152 * rgb[1] + 0.0722 * rgb[2];
  }

  List<int> _hexToRBG(String colorStr) {
    final List<int> rbg = [];
    rbg.add(int.parse(colorStr.substring(1, 3), radix: 16));
    rbg.add(int.parse(colorStr.substring(3, 5), radix: 16));
    rbg.add(int.parse(colorStr.substring(5, 7), radix: 16));
    return rbg;
  }

  /// this will return Inverse black or white color based on input color
  String getInverseBW(String hexColor) {
    final double luminance = _calculateLuminance(_hexToRBG(hexColor));
    final String inverse = (luminance < 140) ? "#ffffff" : "#000000";
    return inverse;
  }
}
