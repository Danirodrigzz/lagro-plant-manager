import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lagro_plant_manager/core/theme/app_colors.dart';
import 'package:lagro_plant_manager/core/utils/icon_helpers.dart';

void main() {
  group('AppColors', () {
    test('Primary color should be the correct green', () {
      expect(AppColors.primary, isA<Color>());
    });

    test('Dark theme background colors should be defined', () {
      expect(AppColors.darkBackground, isA<Color>());
      expect(AppColors.darkSurface, isA<Color>());
      expect(AppColors.darkCard, isA<Color>());
      expect(AppColors.darkBorder, isA<Color>());
    });

    test('Text colors for light and dark should be defined', () {
      expect(AppColors.textPrimary, isA<Color>());
      expect(AppColors.textSecondary, isA<Color>());
      expect(AppColors.darkTextPrimary, isA<Color>());
      expect(AppColors.darkTextSecondary, isA<Color>());
    });
  });

  group('IconHelpers', () {
    test('Should return correct icon for Interior category', () {
      expect(IconHelpers.getCategoryIcon('Interior'), Icons.energy_savings_leaf_rounded);
    });

    test('Should return correct icon for Exterior category', () {
      expect(IconHelpers.getCategoryIcon('Exterior'), Icons.park_rounded);
    });

    test('Should return correct icon for Acuáticas category', () {
      expect(IconHelpers.getCategoryIcon('Acuáticas'), Icons.water_drop_rounded);
    });

    test('Should return correct icon for Suculentas category', () {
      expect(IconHelpers.getCategoryIcon('Suculentas'), Icons.grass_rounded);
    });

    test('Should return default icon for unknown category', () {
      expect(IconHelpers.getCategoryIcon('Desconocida'), Icons.eco_rounded);
    });
  });
}
