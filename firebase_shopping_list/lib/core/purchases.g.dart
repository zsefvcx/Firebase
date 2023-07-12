// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: non_constant_identifier_names
_$_Purchasese _$$_PurchaseseFromJson(Map<String, dynamic> json) =>
    _$_Purchasese(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      count: json['count'] as int,
      unit: json['unit'] as String,
      bought: json['bought'] as bool,
    );

// ignore: non_constant_identifier_names
Map<String, dynamic> _$$_PurchaseseToJson(_$_Purchasese instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'count': instance.count,
      'unit': instance.unit,
      'bought': instance.bought,
    };
