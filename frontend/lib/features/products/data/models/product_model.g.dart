// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductModelImpl _$$ProductModelImplFromJson(Map<String, dynamic> json) =>
    _$ProductModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      scientificName: json['scientificName'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      stock: (json['stock'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      careDifficulty: json['careDifficulty'] as String,
      originCountry: json['originCountry'] as String,
      sunlightNeeds: json['sunlightNeeds'] as String,
      waterFrequency: json['waterFrequency'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      category:
          CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProductModelImplToJson(_$ProductModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'scientificName': instance.scientificName,
      'description': instance.description,
      'price': instance.price,
      'stock': instance.stock,
      'imageUrl': instance.imageUrl,
      'careDifficulty': instance.careDifficulty,
      'originCountry': instance.originCountry,
      'sunlightNeeds': instance.sunlightNeeds,
      'waterFrequency': instance.waterFrequency,
      'createdAt': instance.createdAt.toIso8601String(),
      'category': instance.category,
    };

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };
