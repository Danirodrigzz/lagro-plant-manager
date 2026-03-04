import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import '../../domain/entities/product.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  @HiveType(typeId: 0, adapterName: 'ProductModelAdapter')
  const factory ProductModel({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required String scientificName,
    @HiveField(3) required String description,
    @HiveField(4) required double price,
    @HiveField(5) required int stock,
    @HiveField(6) required String imageUrl,
    @HiveField(7) required String careDifficulty,
    @HiveField(8) required String originCountry,
    @HiveField(9) required String sunlightNeeds,
    @HiveField(10) required String waterFrequency,
    @HiveField(11) required DateTime createdAt,
    @HiveField(12) required CategoryModel category,
    @HiveField(13) @Default([]) List<SaleModel> sales,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class SaleModel with _$SaleModel {
  @HiveType(typeId: 2, adapterName: 'SaleModelAdapter')
  const factory SaleModel({
    @HiveField(0) required int id,
    @HiveField(1) required int quantity,
    @HiveField(2) required double totalPrice,
    @HiveField(3) required DateTime soldAt,
  }) = _SaleModel;

  factory SaleModel.fromJson(Map<String, dynamic> json) =>
      _$SaleModelFromJson(json);
}

@freezed
class CategoryModel with _$CategoryModel {
  @HiveType(typeId: 1, adapterName: 'CategoryModelAdapter')
  const factory CategoryModel({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required String icon,
  }) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

extension ProductModelX on ProductModel {
  Product toEntity() => Product(
        id: id,
        name: name,
        scientificName: scientificName,
        description: description,
        price: price,
        stock: stock,
        imageUrl: imageUrl,
        careDifficulty: careDifficulty,
        originCountry: originCountry,
        sunlightNeeds: sunlightNeeds,
        waterFrequency: waterFrequency,
        createdAt: createdAt,
        categoryName: category.name,
        categoryIcon: category.icon,
        sales: sales.map((s) => s.toEntity()).toList(),
      );
}

extension SaleModelX on SaleModel {
  Sale toEntity() => Sale(
        id: id,
        quantity: quantity,
        totalPrice: totalPrice,
        soldAt: soldAt,
      );
}

extension CategoryModelX on CategoryModel {
  Category toEntity() => Category(
        id: id,
        name: name,
        icon: icon,
      );
}
