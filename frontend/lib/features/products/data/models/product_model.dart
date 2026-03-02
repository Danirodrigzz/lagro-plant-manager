import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/product.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    required String name,
    required String scientificName,
    required String description,
    required double price,
    required int stock,
    required String imageUrl,
    required String careDifficulty,
    required String originCountry,
    required String sunlightNeeds,
    required String waterFrequency,
    required DateTime createdAt,
    required CategoryModel category,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required String name,
    required String icon,
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
      );
}
