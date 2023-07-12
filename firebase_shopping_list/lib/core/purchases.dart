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

class PurchasesList {
  static final Map<int, Purchase> _purchases = {};

  static int get length => _purchases.length;

  static Purchase? get(int id) => _purchases[id];

  static bool add(Purchase data) {
    int id = data.id;
    if(_purchases[id]==null) {
       _purchases[id]=data;
       return true;
    }
    return false;
  }

  static remAll() {
    _purchases.clear();
  }

  static bool rem(int id) {
    Purchase? purchase = _purchases[id];
    if(purchase!=null) {
      _purchases.remove(id);
      return true;
    }
    return false;
  }

  static bool mod(Purchase data) {
    int id = data.id;
    Purchase? purchase = _purchases[id];
    if(purchase!=null) {
      _purchases[id]=data;
      return true;
    }
    return false;
  }

  static void fromJson(dynamic data){
    if (data is List<dynamic>){
      for (var element in data) {
        if (element is Map<String, dynamic>){
          if (element['id'] is int) {
            int id = element['id'] as int;
            if (_purchases[id] == null) {
                _purchases[id] = Purchase.fromJson(element);
            }
          }
        }
      }
    }
  }

  @override
  String toString() {
    return _purchases.toString();
  }
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