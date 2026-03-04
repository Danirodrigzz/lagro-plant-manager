// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<_$ProductModelImpl> {
  @override
  final int typeId = 0;

  @override
  _$ProductModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$ProductModelImpl(
      id: fields[0] as int,
      name: fields[1] as String,
      scientificName: fields[2] as String,
      description: fields[3] as String,
      price: fields[4] as double,
      stock: fields[5] as int,
      imageUrl: fields[6] as String,
      careDifficulty: fields[7] as String,
      originCountry: fields[8] as String,
      sunlightNeeds: fields[9] as String,
      waterFrequency: fields[10] as String,
      createdAt: fields[11] as DateTime,
      category: fields[12] as CategoryModel,
      sales: (fields[13] as List).cast<SaleModel>(),
      supplier: fields[14] as SupplierModel,
      season: fields[15] as SeasonModel,
    );
  }

  @override
  void write(BinaryWriter writer, _$ProductModelImpl obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.scientificName)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.stock)
      ..writeByte(6)
      ..write(obj.imageUrl)
      ..writeByte(7)
      ..write(obj.careDifficulty)
      ..writeByte(8)
      ..write(obj.originCountry)
      ..writeByte(9)
      ..write(obj.sunlightNeeds)
      ..writeByte(10)
      ..write(obj.waterFrequency)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.category)
      ..writeByte(14)
      ..write(obj.supplier)
      ..writeByte(15)
      ..write(obj.season)
      ..writeByte(13)
      ..write(obj.sales);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SaleModelAdapter extends TypeAdapter<_$SaleModelImpl> {
  @override
  final int typeId = 2;

  @override
  _$SaleModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SaleModelImpl(
      id: fields[0] as int,
      quantity: fields[1] as int,
      totalPrice: fields[2] as double,
      soldAt: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$SaleModelImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.quantity)
      ..writeByte(2)
      ..write(obj.totalPrice)
      ..writeByte(3)
      ..write(obj.soldAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SupplierModelAdapter extends TypeAdapter<_$SupplierModelImpl> {
  @override
  final int typeId = 3;

  @override
  _$SupplierModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SupplierModelImpl(
      id: fields[0] as int,
      name: fields[1] as String,
      contact: fields[2] as String,
      region: fields[3] as String,
      rating: fields[4] as double,
    );
  }

  @override
  void write(BinaryWriter writer, _$SupplierModelImpl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.contact)
      ..writeByte(3)
      ..write(obj.region)
      ..writeByte(4)
      ..write(obj.rating);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SupplierModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SeasonModelAdapter extends TypeAdapter<_$SeasonModelImpl> {
  @override
  final int typeId = 4;

  @override
  _$SeasonModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$SeasonModelImpl(
      id: fields[0] as int,
      name: fields[1] as String,
      startMonth: fields[2] as int,
      endMonth: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, _$SeasonModelImpl obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.startMonth)
      ..writeByte(3)
      ..write(obj.endMonth);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeasonModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryModelAdapter extends TypeAdapter<_$CategoryModelImpl> {
  @override
  final int typeId = 1;

  @override
  _$CategoryModelImpl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$CategoryModelImpl(
      id: fields[0] as int,
      name: fields[1] as String,
      icon: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, _$CategoryModelImpl obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

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
      sales: (json['sales'] as List<dynamic>?)
              ?.map((e) => SaleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      supplier:
          SupplierModel.fromJson(json['supplier'] as Map<String, dynamic>),
      season: SeasonModel.fromJson(json['season'] as Map<String, dynamic>),
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
      'sales': instance.sales,
      'supplier': instance.supplier,
      'season': instance.season,
    };

_$SaleModelImpl _$$SaleModelImplFromJson(Map<String, dynamic> json) =>
    _$SaleModelImpl(
      id: (json['id'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      soldAt: DateTime.parse(json['soldAt'] as String),
    );

Map<String, dynamic> _$$SaleModelImplToJson(_$SaleModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quantity': instance.quantity,
      'totalPrice': instance.totalPrice,
      'soldAt': instance.soldAt.toIso8601String(),
    };

_$SupplierModelImpl _$$SupplierModelImplFromJson(Map<String, dynamic> json) =>
    _$SupplierModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      contact: json['contact'] as String,
      region: json['region'] as String,
      rating: (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$$SupplierModelImplToJson(_$SupplierModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'contact': instance.contact,
      'region': instance.region,
      'rating': instance.rating,
    };

_$SeasonModelImpl _$$SeasonModelImplFromJson(Map<String, dynamic> json) =>
    _$SeasonModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      startMonth: (json['startMonth'] as num).toInt(),
      endMonth: (json['endMonth'] as num).toInt(),
    );

Map<String, dynamic> _$$SeasonModelImplToJson(_$SeasonModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'startMonth': instance.startMonth,
      'endMonth': instance.endMonth,
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
