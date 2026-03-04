import 'package:hive/hive.dart';
import '../models/product_model.dart';

class ProductsLocalDataSource {
  static const String boxName = 'products_box_v2';

  Future<void> saveProducts(List<ProductModel> products) async {
    final box = await Hive.openBox<ProductModel>(boxName);
    final Map<int, ProductModel> productsMap = {
      for (var product in products) product.id: product
    };
    await box.putAll(productsMap);
  }

  Future<List<ProductModel>> getCachedProducts() async {
    final box = await Hive.openBox<ProductModel>(boxName);
    return box.values.toList();
  }

  Future<void> clearCache() async {
    final box = await Hive.openBox<ProductModel>(boxName);
    await box.clear();
  }
}
