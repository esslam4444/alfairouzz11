import 'package:flutter/material.dart';

extension ToMaterialColor on Color {
  MaterialColor toMaterialColor() {
    final swatch = _getMaterialColorValues(this);
    return MaterialColor(value, swatch);
  }

  Map<int, Color> _getMaterialColorValues(Color primary) => <int, Color>{
        50: _getSwatchShade(primary, 50),
        100: _getSwatchShade(primary, 100),
        200: _getSwatchShade(primary, 200),
        300: _getSwatchShade(primary, 300),
        400: _getSwatchShade(primary, 400),
        500: _getSwatchShade(primary, 500),
        600: _getSwatchShade(primary, 600),
        700: _getSwatchShade(primary, 700),
        800: _getSwatchShade(primary, 800),
        900: _getSwatchShade(primary, 900),
      };

  Color _getSwatchShade(Color c, int swatchValue) {
    final hsl = HSLColor.fromColor(c);
    return hsl.withLightness(1 - (swatchValue / 1000)).toColor();
  }
}
