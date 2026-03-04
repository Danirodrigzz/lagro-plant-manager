// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) {
  return _ProductModel.fromJson(json);
}

/// @nodoc
mixin _$ProductModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get scientificName => throw _privateConstructorUsedError;
  @HiveField(3)
  String get description => throw _privateConstructorUsedError;
  @HiveField(4)
  double get price => throw _privateConstructorUsedError;
  @HiveField(5)
  int get stock => throw _privateConstructorUsedError;
  @HiveField(6)
  String get imageUrl => throw _privateConstructorUsedError;
  @HiveField(7)
  String get careDifficulty => throw _privateConstructorUsedError;
  @HiveField(8)
  String get originCountry => throw _privateConstructorUsedError;
  @HiveField(9)
  String get sunlightNeeds => throw _privateConstructorUsedError;
  @HiveField(10)
  String get waterFrequency => throw _privateConstructorUsedError;
  @HiveField(11)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @HiveField(12)
  CategoryModel get category => throw _privateConstructorUsedError;
  @HiveField(13)
  List<SaleModel> get sales => throw _privateConstructorUsedError;
  @HiveField(14)
  SupplierModel get supplier => throw _privateConstructorUsedError;
  @HiveField(15)
  SeasonModel get season => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductModelCopyWith<ProductModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductModelCopyWith<$Res> {
  factory $ProductModelCopyWith(
          ProductModel value, $Res Function(ProductModel) then) =
      _$ProductModelCopyWithImpl<$Res, ProductModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String scientificName,
      @HiveField(3) String description,
      @HiveField(4) double price,
      @HiveField(5) int stock,
      @HiveField(6) String imageUrl,
      @HiveField(7) String careDifficulty,
      @HiveField(8) String originCountry,
      @HiveField(9) String sunlightNeeds,
      @HiveField(10) String waterFrequency,
      @HiveField(11) DateTime createdAt,
      @HiveField(12) CategoryModel category,
      @HiveField(13) List<SaleModel> sales,
      @HiveField(14) SupplierModel supplier,
      @HiveField(15) SeasonModel season});

  $CategoryModelCopyWith<$Res> get category;
  $SupplierModelCopyWith<$Res> get supplier;
  $SeasonModelCopyWith<$Res> get season;
}

/// @nodoc
class _$ProductModelCopyWithImpl<$Res, $Val extends ProductModel>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? scientificName = null,
    Object? description = null,
    Object? price = null,
    Object? stock = null,
    Object? imageUrl = null,
    Object? careDifficulty = null,
    Object? originCountry = null,
    Object? sunlightNeeds = null,
    Object? waterFrequency = null,
    Object? createdAt = null,
    Object? category = null,
    Object? sales = null,
    Object? supplier = null,
    Object? season = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      scientificName: null == scientificName
          ? _value.scientificName
          : scientificName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      careDifficulty: null == careDifficulty
          ? _value.careDifficulty
          : careDifficulty // ignore: cast_nullable_to_non_nullable
              as String,
      originCountry: null == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String,
      sunlightNeeds: null == sunlightNeeds
          ? _value.sunlightNeeds
          : sunlightNeeds // ignore: cast_nullable_to_non_nullable
              as String,
      waterFrequency: null == waterFrequency
          ? _value.waterFrequency
          : waterFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      sales: null == sales
          ? _value.sales
          : sales // ignore: cast_nullable_to_non_nullable
              as List<SaleModel>,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as SupplierModel,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as SeasonModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res> get category {
    return $CategoryModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SupplierModelCopyWith<$Res> get supplier {
    return $SupplierModelCopyWith<$Res>(_value.supplier, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SeasonModelCopyWith<$Res> get season {
    return $SeasonModelCopyWith<$Res>(_value.season, (value) {
      return _then(_value.copyWith(season: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductModelImplCopyWith<$Res>
    implements $ProductModelCopyWith<$Res> {
  factory _$$ProductModelImplCopyWith(
          _$ProductModelImpl value, $Res Function(_$ProductModelImpl) then) =
      __$$ProductModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String scientificName,
      @HiveField(3) String description,
      @HiveField(4) double price,
      @HiveField(5) int stock,
      @HiveField(6) String imageUrl,
      @HiveField(7) String careDifficulty,
      @HiveField(8) String originCountry,
      @HiveField(9) String sunlightNeeds,
      @HiveField(10) String waterFrequency,
      @HiveField(11) DateTime createdAt,
      @HiveField(12) CategoryModel category,
      @HiveField(13) List<SaleModel> sales,
      @HiveField(14) SupplierModel supplier,
      @HiveField(15) SeasonModel season});

  @override
  $CategoryModelCopyWith<$Res> get category;
  @override
  $SupplierModelCopyWith<$Res> get supplier;
  @override
  $SeasonModelCopyWith<$Res> get season;
}

/// @nodoc
class __$$ProductModelImplCopyWithImpl<$Res>
    extends _$ProductModelCopyWithImpl<$Res, _$ProductModelImpl>
    implements _$$ProductModelImplCopyWith<$Res> {
  __$$ProductModelImplCopyWithImpl(
      _$ProductModelImpl _value, $Res Function(_$ProductModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? scientificName = null,
    Object? description = null,
    Object? price = null,
    Object? stock = null,
    Object? imageUrl = null,
    Object? careDifficulty = null,
    Object? originCountry = null,
    Object? sunlightNeeds = null,
    Object? waterFrequency = null,
    Object? createdAt = null,
    Object? category = null,
    Object? sales = null,
    Object? supplier = null,
    Object? season = null,
  }) {
    return _then(_$ProductModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      scientificName: null == scientificName
          ? _value.scientificName
          : scientificName // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as int,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      careDifficulty: null == careDifficulty
          ? _value.careDifficulty
          : careDifficulty // ignore: cast_nullable_to_non_nullable
              as String,
      originCountry: null == originCountry
          ? _value.originCountry
          : originCountry // ignore: cast_nullable_to_non_nullable
              as String,
      sunlightNeeds: null == sunlightNeeds
          ? _value.sunlightNeeds
          : sunlightNeeds // ignore: cast_nullable_to_non_nullable
              as String,
      waterFrequency: null == waterFrequency
          ? _value.waterFrequency
          : waterFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as CategoryModel,
      sales: null == sales
          ? _value._sales
          : sales // ignore: cast_nullable_to_non_nullable
              as List<SaleModel>,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as SupplierModel,
      season: null == season
          ? _value.season
          : season // ignore: cast_nullable_to_non_nullable
              as SeasonModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 0, adapterName: 'ProductModelAdapter')
class _$ProductModelImpl implements _ProductModel {
  const _$ProductModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.scientificName,
      @HiveField(3) required this.description,
      @HiveField(4) required this.price,
      @HiveField(5) required this.stock,
      @HiveField(6) required this.imageUrl,
      @HiveField(7) required this.careDifficulty,
      @HiveField(8) required this.originCountry,
      @HiveField(9) required this.sunlightNeeds,
      @HiveField(10) required this.waterFrequency,
      @HiveField(11) required this.createdAt,
      @HiveField(12) required this.category,
      @HiveField(13) final List<SaleModel> sales = const [],
      @HiveField(14) required this.supplier,
      @HiveField(15) required this.season})
      : _sales = sales;

  factory _$ProductModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String scientificName;
  @override
  @HiveField(3)
  final String description;
  @override
  @HiveField(4)
  final double price;
  @override
  @HiveField(5)
  final int stock;
  @override
  @HiveField(6)
  final String imageUrl;
  @override
  @HiveField(7)
  final String careDifficulty;
  @override
  @HiveField(8)
  final String originCountry;
  @override
  @HiveField(9)
  final String sunlightNeeds;
  @override
  @HiveField(10)
  final String waterFrequency;
  @override
  @HiveField(11)
  final DateTime createdAt;
  @override
  @HiveField(12)
  final CategoryModel category;
  final List<SaleModel> _sales;
  @override
  @JsonKey()
  @HiveField(13)
  List<SaleModel> get sales {
    if (_sales is EqualUnmodifiableListView) return _sales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sales);
  }

  @override
  @HiveField(14)
  final SupplierModel supplier;
  @override
  @HiveField(15)
  final SeasonModel season;

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, scientificName: $scientificName, description: $description, price: $price, stock: $stock, imageUrl: $imageUrl, careDifficulty: $careDifficulty, originCountry: $originCountry, sunlightNeeds: $sunlightNeeds, waterFrequency: $waterFrequency, createdAt: $createdAt, category: $category, sales: $sales, supplier: $supplier, season: $season)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.scientificName, scientificName) ||
                other.scientificName == scientificName) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.careDifficulty, careDifficulty) ||
                other.careDifficulty == careDifficulty) &&
            (identical(other.originCountry, originCountry) ||
                other.originCountry == originCountry) &&
            (identical(other.sunlightNeeds, sunlightNeeds) ||
                other.sunlightNeeds == sunlightNeeds) &&
            (identical(other.waterFrequency, waterFrequency) ||
                other.waterFrequency == waterFrequency) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._sales, _sales) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.season, season) || other.season == season));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      scientificName,
      description,
      price,
      stock,
      imageUrl,
      careDifficulty,
      originCountry,
      sunlightNeeds,
      waterFrequency,
      createdAt,
      category,
      const DeepCollectionEquality().hash(_sales),
      supplier,
      season);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      __$$ProductModelImplCopyWithImpl<_$ProductModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductModelImplToJson(
      this,
    );
  }
}

abstract class _ProductModel implements ProductModel {
  const factory _ProductModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String scientificName,
      @HiveField(3) required final String description,
      @HiveField(4) required final double price,
      @HiveField(5) required final int stock,
      @HiveField(6) required final String imageUrl,
      @HiveField(7) required final String careDifficulty,
      @HiveField(8) required final String originCountry,
      @HiveField(9) required final String sunlightNeeds,
      @HiveField(10) required final String waterFrequency,
      @HiveField(11) required final DateTime createdAt,
      @HiveField(12) required final CategoryModel category,
      @HiveField(13) final List<SaleModel> sales,
      @HiveField(14) required final SupplierModel supplier,
      @HiveField(15) required final SeasonModel season}) = _$ProductModelImpl;

  factory _ProductModel.fromJson(Map<String, dynamic> json) =
      _$ProductModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get scientificName;
  @override
  @HiveField(3)
  String get description;
  @override
  @HiveField(4)
  double get price;
  @override
  @HiveField(5)
  int get stock;
  @override
  @HiveField(6)
  String get imageUrl;
  @override
  @HiveField(7)
  String get careDifficulty;
  @override
  @HiveField(8)
  String get originCountry;
  @override
  @HiveField(9)
  String get sunlightNeeds;
  @override
  @HiveField(10)
  String get waterFrequency;
  @override
  @HiveField(11)
  DateTime get createdAt;
  @override
  @HiveField(12)
  CategoryModel get category;
  @override
  @HiveField(13)
  List<SaleModel> get sales;
  @override
  @HiveField(14)
  SupplierModel get supplier;
  @override
  @HiveField(15)
  SeasonModel get season;
  @override
  @JsonKey(ignore: true)
  _$$ProductModelImplCopyWith<_$ProductModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SaleModel _$SaleModelFromJson(Map<String, dynamic> json) {
  return _SaleModel.fromJson(json);
}

/// @nodoc
mixin _$SaleModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  int get quantity => throw _privateConstructorUsedError;
  @HiveField(2)
  double get totalPrice => throw _privateConstructorUsedError;
  @HiveField(3)
  DateTime get soldAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SaleModelCopyWith<SaleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaleModelCopyWith<$Res> {
  factory $SaleModelCopyWith(SaleModel value, $Res Function(SaleModel) then) =
      _$SaleModelCopyWithImpl<$Res, SaleModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) int quantity,
      @HiveField(2) double totalPrice,
      @HiveField(3) DateTime soldAt});
}

/// @nodoc
class _$SaleModelCopyWithImpl<$Res, $Val extends SaleModel>
    implements $SaleModelCopyWith<$Res> {
  _$SaleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? totalPrice = null,
    Object? soldAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      soldAt: null == soldAt
          ? _value.soldAt
          : soldAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SaleModelImplCopyWith<$Res>
    implements $SaleModelCopyWith<$Res> {
  factory _$$SaleModelImplCopyWith(
          _$SaleModelImpl value, $Res Function(_$SaleModelImpl) then) =
      __$$SaleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) int quantity,
      @HiveField(2) double totalPrice,
      @HiveField(3) DateTime soldAt});
}

/// @nodoc
class __$$SaleModelImplCopyWithImpl<$Res>
    extends _$SaleModelCopyWithImpl<$Res, _$SaleModelImpl>
    implements _$$SaleModelImplCopyWith<$Res> {
  __$$SaleModelImplCopyWithImpl(
      _$SaleModelImpl _value, $Res Function(_$SaleModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? totalPrice = null,
    Object? soldAt = null,
  }) {
    return _then(_$SaleModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      soldAt: null == soldAt
          ? _value.soldAt
          : soldAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 2, adapterName: 'SaleModelAdapter')
class _$SaleModelImpl implements _SaleModel {
  const _$SaleModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.quantity,
      @HiveField(2) required this.totalPrice,
      @HiveField(3) required this.soldAt});

  factory _$SaleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SaleModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final int quantity;
  @override
  @HiveField(2)
  final double totalPrice;
  @override
  @HiveField(3)
  final DateTime soldAt;

  @override
  String toString() {
    return 'SaleModel(id: $id, quantity: $quantity, totalPrice: $totalPrice, soldAt: $soldAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaleModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.soldAt, soldAt) || other.soldAt == soldAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, quantity, totalPrice, soldAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SaleModelImplCopyWith<_$SaleModelImpl> get copyWith =>
      __$$SaleModelImplCopyWithImpl<_$SaleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SaleModelImplToJson(
      this,
    );
  }
}

abstract class _SaleModel implements SaleModel {
  const factory _SaleModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final int quantity,
      @HiveField(2) required final double totalPrice,
      @HiveField(3) required final DateTime soldAt}) = _$SaleModelImpl;

  factory _SaleModel.fromJson(Map<String, dynamic> json) =
      _$SaleModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  int get quantity;
  @override
  @HiveField(2)
  double get totalPrice;
  @override
  @HiveField(3)
  DateTime get soldAt;
  @override
  @JsonKey(ignore: true)
  _$$SaleModelImplCopyWith<_$SaleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SupplierModel _$SupplierModelFromJson(Map<String, dynamic> json) {
  return _SupplierModel.fromJson(json);
}

/// @nodoc
mixin _$SupplierModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get contact => throw _privateConstructorUsedError;
  @HiveField(3)
  String get region => throw _privateConstructorUsedError;
  @HiveField(4)
  double get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SupplierModelCopyWith<SupplierModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupplierModelCopyWith<$Res> {
  factory $SupplierModelCopyWith(
          SupplierModel value, $Res Function(SupplierModel) then) =
      _$SupplierModelCopyWithImpl<$Res, SupplierModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String contact,
      @HiveField(3) String region,
      @HiveField(4) double rating});
}

/// @nodoc
class _$SupplierModelCopyWithImpl<$Res, $Val extends SupplierModel>
    implements $SupplierModelCopyWith<$Res> {
  _$SupplierModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? contact = null,
    Object? region = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SupplierModelImplCopyWith<$Res>
    implements $SupplierModelCopyWith<$Res> {
  factory _$$SupplierModelImplCopyWith(
          _$SupplierModelImpl value, $Res Function(_$SupplierModelImpl) then) =
      __$$SupplierModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String contact,
      @HiveField(3) String region,
      @HiveField(4) double rating});
}

/// @nodoc
class __$$SupplierModelImplCopyWithImpl<$Res>
    extends _$SupplierModelCopyWithImpl<$Res, _$SupplierModelImpl>
    implements _$$SupplierModelImplCopyWith<$Res> {
  __$$SupplierModelImplCopyWithImpl(
      _$SupplierModelImpl _value, $Res Function(_$SupplierModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? contact = null,
    Object? region = null,
    Object? rating = null,
  }) {
    return _then(_$SupplierModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      region: null == region
          ? _value.region
          : region // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 3, adapterName: 'SupplierModelAdapter')
class _$SupplierModelImpl implements _SupplierModel {
  const _$SupplierModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.contact,
      @HiveField(3) required this.region,
      @HiveField(4) required this.rating});

  factory _$SupplierModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupplierModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String contact;
  @override
  @HiveField(3)
  final String region;
  @override
  @HiveField(4)
  final double rating;

  @override
  String toString() {
    return 'SupplierModel(id: $id, name: $name, contact: $contact, region: $region, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupplierModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, contact, region, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SupplierModelImplCopyWith<_$SupplierModelImpl> get copyWith =>
      __$$SupplierModelImplCopyWithImpl<_$SupplierModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupplierModelImplToJson(
      this,
    );
  }
}

abstract class _SupplierModel implements SupplierModel {
  const factory _SupplierModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String contact,
      @HiveField(3) required final String region,
      @HiveField(4) required final double rating}) = _$SupplierModelImpl;

  factory _SupplierModel.fromJson(Map<String, dynamic> json) =
      _$SupplierModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get contact;
  @override
  @HiveField(3)
  String get region;
  @override
  @HiveField(4)
  double get rating;
  @override
  @JsonKey(ignore: true)
  _$$SupplierModelImplCopyWith<_$SupplierModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SeasonModel _$SeasonModelFromJson(Map<String, dynamic> json) {
  return _SeasonModel.fromJson(json);
}

/// @nodoc
mixin _$SeasonModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  int get startMonth => throw _privateConstructorUsedError;
  @HiveField(3)
  int get endMonth => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeasonModelCopyWith<SeasonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeasonModelCopyWith<$Res> {
  factory $SeasonModelCopyWith(
          SeasonModel value, $Res Function(SeasonModel) then) =
      _$SeasonModelCopyWithImpl<$Res, SeasonModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) int startMonth,
      @HiveField(3) int endMonth});
}

/// @nodoc
class _$SeasonModelCopyWithImpl<$Res, $Val extends SeasonModel>
    implements $SeasonModelCopyWith<$Res> {
  _$SeasonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startMonth = null,
    Object? endMonth = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startMonth: null == startMonth
          ? _value.startMonth
          : startMonth // ignore: cast_nullable_to_non_nullable
              as int,
      endMonth: null == endMonth
          ? _value.endMonth
          : endMonth // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeasonModelImplCopyWith<$Res>
    implements $SeasonModelCopyWith<$Res> {
  factory _$$SeasonModelImplCopyWith(
          _$SeasonModelImpl value, $Res Function(_$SeasonModelImpl) then) =
      __$$SeasonModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) int startMonth,
      @HiveField(3) int endMonth});
}

/// @nodoc
class __$$SeasonModelImplCopyWithImpl<$Res>
    extends _$SeasonModelCopyWithImpl<$Res, _$SeasonModelImpl>
    implements _$$SeasonModelImplCopyWith<$Res> {
  __$$SeasonModelImplCopyWithImpl(
      _$SeasonModelImpl _value, $Res Function(_$SeasonModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? startMonth = null,
    Object? endMonth = null,
  }) {
    return _then(_$SeasonModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      startMonth: null == startMonth
          ? _value.startMonth
          : startMonth // ignore: cast_nullable_to_non_nullable
              as int,
      endMonth: null == endMonth
          ? _value.endMonth
          : endMonth // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 4, adapterName: 'SeasonModelAdapter')
class _$SeasonModelImpl implements _SeasonModel {
  const _$SeasonModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.startMonth,
      @HiveField(3) required this.endMonth});

  factory _$SeasonModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeasonModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final int startMonth;
  @override
  @HiveField(3)
  final int endMonth;

  @override
  String toString() {
    return 'SeasonModel(id: $id, name: $name, startMonth: $startMonth, endMonth: $endMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeasonModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startMonth, startMonth) ||
                other.startMonth == startMonth) &&
            (identical(other.endMonth, endMonth) ||
                other.endMonth == endMonth));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, startMonth, endMonth);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeasonModelImplCopyWith<_$SeasonModelImpl> get copyWith =>
      __$$SeasonModelImplCopyWithImpl<_$SeasonModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeasonModelImplToJson(
      this,
    );
  }
}

abstract class _SeasonModel implements SeasonModel {
  const factory _SeasonModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String name,
      @HiveField(2) required final int startMonth,
      @HiveField(3) required final int endMonth}) = _$SeasonModelImpl;

  factory _SeasonModel.fromJson(Map<String, dynamic> json) =
      _$SeasonModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  int get startMonth;
  @override
  @HiveField(3)
  int get endMonth;
  @override
  @JsonKey(ignore: true)
  _$$SeasonModelImplCopyWith<_$SeasonModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  @HiveField(0)
  int get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
          CategoryModel value, $Res Function(CategoryModel) then) =
      _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String icon});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
          _$CategoryModelImpl value, $Res Function(_$CategoryModelImpl) then) =
      __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) int id,
      @HiveField(1) String name,
      @HiveField(2) String icon});
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
      _$CategoryModelImpl _value, $Res Function(_$CategoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? icon = null,
  }) {
    return _then(_$CategoryModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
@HiveType(typeId: 1, adapterName: 'CategoryModelAdapter')
class _$CategoryModelImpl implements _CategoryModel {
  const _$CategoryModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) required this.icon});

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  @HiveField(0)
  final int id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String icon;

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(
      this,
    );
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel(
      {@HiveField(0) required final int id,
      @HiveField(1) required final String name,
      @HiveField(2) required final String icon}) = _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  @HiveField(0)
  int get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String get icon;
  @override
  @JsonKey(ignore: true)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
