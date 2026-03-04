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
      @HiveField(13) List<SaleModel> sales});

  $CategoryModelCopyWith<$Res> get category;
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
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryModelCopyWith<$Res> get category {
    return $CategoryModelCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
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
      @HiveField(13) List<SaleModel> sales});

  @override
  $CategoryModelCopyWith<$Res> get category;
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
      @HiveField(13) final List<SaleModel> sales = const []})
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
  String toString() {
    return 'ProductModel(id: $id, name: $name, scientificName: $scientificName, description: $description, price: $price, stock: $stock, imageUrl: $imageUrl, careDifficulty: $careDifficulty, originCountry: $originCountry, sunlightNeeds: $sunlightNeeds, waterFrequency: $waterFrequency, createdAt: $createdAt, category: $category, sales: $sales)';
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
            const DeepCollectionEquality().equals(other._sales, _sales));
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
      const DeepCollectionEquality().hash(_sales));

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
      @HiveField(13) final List<SaleModel> sales}) = _$ProductModelImpl;

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
