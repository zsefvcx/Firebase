import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'purchases.freezed.dart';

part 'purchases.g.dart';

//dart run build_runner build

enum StatusOfAddingPurchases{
  add,
  //rem,
  brk,
  def;

}

@Freezed(makeCollectionsUnmodifiable: false)
class PurchasesList with _$PurchasesList {

  const factory PurchasesList({
    required List<Purchase> purchases,
  }) = _PurchasesList;

  factory PurchasesList.fromJson(Map<String, Object?> json)
  => _$PurchasesListFromJson(json);
}

@freezed
class Purchase with _$Purchase{

  const factory Purchase({
    required int id,
    required String name,
    required int price,
    required int count,
    required String unit,
    required bool bought
  }) = _Purchasese;

  factory Purchase.fromJson(Map<String, Object?> json)
      => _$PurchaseFromJson(json);
}