import 'package:flutter/material.dart';

class IconHelpers {
  static IconData getCategoryIcon(String categoryName) {
    switch (categoryName.toLowerCase()) {
      case 'interior':
        return Icons.energy_savings_leaf_rounded;
      case 'exterior':
        return Icons.park_rounded;
      case 'suculentas':
      case 'cactus':
        return Icons.grass_rounded;
      case 'acuáticas':
      case 'acuaticas':
        return Icons.water_drop_rounded;
      default:
        return Icons.eco_rounded;
    }
  }
}
