// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchases.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Purchase _$PurchaseFromJson(Map<String, dynamic> json) {
  return _Purchasese.fromJson(json);
}

/// @nodoc
mixin _$Purchase {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  bool get bought => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurchaseCopyWith<Purchase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseCopyWith<$Res> {
  factory $PurchaseCopyWith(Purchase value, $Res Function(Purchase) then) =
      _$PurchaseCopyWithImpl<$Res, Purchase>;
  @useResult
  $Res call(
      {int id, String name, int price, int count, String unit, bool bought});
}

/// @nodoc
class _$PurchaseCopyWithImpl<$Res, $Val extends Purchase>
    implements $PurchaseCopyWith<$Res> {
  _$PurchaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? count = null,
    Object? unit = null,
    Object? bought = null,
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
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      bought: null == bought
          ? _value.bought
          : bought // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PurchaseseCopyWith<$Res> implements $PurchaseCopyWith<$Res> {
  factory _$$_PurchaseseCopyWith(
          _$_Purchasese value, $Res Function(_$_Purchasese) then) =
      __$$_PurchaseseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, int price, int count, String unit, bool bought});
}

/// @nodoc
class __$$_PurchaseseCopyWithImpl<$Res>
    extends _$PurchaseCopyWithImpl<$Res, _$_Purchasese>
    implements _$$_PurchaseseCopyWith<$Res> {
  __$$_PurchaseseCopyWithImpl(
      _$_Purchasese _value, $Res Function(_$_Purchasese) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? count = null,
    Object? unit = null,
    Object? bought = null,
  }) {
    return _then(_$_Purchasese(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      bought: null == bought
          ? _value.bought
          : bought // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Purchasese with DiagnosticableTreeMixin implements _Purchasese {
  const _$_Purchasese(
      {required this.id,
      required this.name,
      required this.price,
      required this.count,
      required this.unit,
      required this.bought});

  factory _$_Purchasese.fromJson(Map<String, dynamic> json) =>
      _$$_PurchaseseFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final int price;
  @override
  final int count;
  @override
  final String unit;
  @override
  final bool bought;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Purchase(id: $id, name: $name, price: $price, count: $count, unit: $unit, bought: $bought)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Purchase'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('count', count))
      ..add(DiagnosticsProperty('unit', unit))
      ..add(DiagnosticsProperty('bought', bought));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Purchasese &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.bought, bought) || other.bought == bought));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, price, count, unit, bought);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PurchaseseCopyWith<_$_Purchasese> get copyWith =>
      __$$_PurchaseseCopyWithImpl<_$_Purchasese>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PurchaseseToJson(
      this,
    );
  }
}

abstract class _Purchasese implements Purchase {
  const factory _Purchasese(
      {required final int id,
      required final String name,
      required final int price,
      required final int count,
      required final String unit,
      required final bool bought}) = _$_Purchasese;

  factory _Purchasese.fromJson(Map<String, dynamic> json) =
      _$_Purchasese.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  int get price;
  @override
  int get count;
  @override
  String get unit;
  @override
  bool get bought;
  @override
  @JsonKey(ignore: true)
  _$$_PurchaseseCopyWith<_$_Purchasese> get copyWith =>
      throw _privateConstructorUsedError;
}
