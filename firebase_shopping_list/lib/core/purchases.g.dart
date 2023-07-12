// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PurchasesList _$$_PurchasesListFromJson(Map<String, dynamic> json) =>
    _$_PurchasesList(
      purchases: (json['purchases'] as List<dynamic>)
          .map((e) => Purchase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PurchasesListToJson(_$_PurchasesList instance) =>
    <String, dynamic>{
      'purchases': instance.purchases,
    };

_$_Purchasese _$$_PurchaseseFromJson(Map<String, dynamic> json) =>
    _$_Purchasese(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      count: json['count'] as int,
      unit: json['unit'] as String,
      bought: json['bought'] as bool,
    );

Map<String, dynamic> _$$_PurchaseseToJson(_$_Purchasese instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'count': instance.count,
      'unit': instance.unit,
      'bought': instance.bought,
    };
