
import 'package:firebase_shopping_list/core/core.dart';

abstract class PurchasesListEntities {
  final ({String id, Purchase purchase}) _purchases;

  String get id => _purchases.id;

  Purchase get purchase => _purchases.purchase;

  PurchasesListEntities({required String id, required Purchase purchase}) :
        _purchases = (id: id, purchase: purchase);

}