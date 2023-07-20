// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'purchases.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Purchasese _$$_PurchaseseFromJson(Map<String, dynamic> json) =>
    _$_Purchasese(
      id: json['id'] as int,
      group: json['group'] as bool,
      groupId: json['groupId'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      count: json['count'] as int,
      unit: json['unit'] as String,
      bought: json['bought'] as bool,
    );

Map<String, dynamic> _$$_PurchaseseToJson(_$_Purchasese instance) =>
    <String, dynamic>{
      'id': instance.id,
      'group': instance.group,
      'groupId': instance.groupId,
      'name': instance.name,
      'price': instance.price,
      'count': instance.count,
      'unit': instance.unit,
      'bought': instance.bought,
    };
