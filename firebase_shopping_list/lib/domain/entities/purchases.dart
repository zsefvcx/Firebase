import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'purchases.freezed.dart';

part 'purchases.g.dart';

//dart run build_runner build

enum StatusOfAddingPurchases{
  add,
  rem,
  brk,
  mod,
  def;
}

@freezed
abstract class Purchase with _$Purchase{

  const factory Purchase({
    required int id,
    required bool group,
    required int groupId,
    required String name,
    required int price,
    required int count,
    required String unit,
    required bool bought
  }) = _Purchasese;

  factory Purchase.fromJson(Map<String, Object?> json)
      => _$PurchaseFromJson(json);
}