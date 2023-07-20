import 'dart:developer' as developer;

import 'package:firebase_shopping_list/domain/domain.dart';
import 'package:firebase_shopping_list/presentation/widget/widget.dart';

import 'package:flutter/material.dart';

Future<void> showCustomDialog(List<bool> vis, Purchase dt, BuildContext context, String id) async {
  switch (await showDialog<(StatusOfAddingPurchases, Purchase)>(
      context: context,
      builder: (BuildContext context) {
        return ShoppingListModWidget(vis: vis, data: dt);
      }).then((value) {
    if (value == null) {
      return (null);
    } else {
      return (value);
    }
  })) {
    case (StatusOfAddingPurchases.add, Purchase data):
      developer.log('${StatusOfAddingPurchases.add}');
      PurchasesList.add(data);
      break;
    case ((StatusOfAddingPurchases.brk, _) ||
          (StatusOfAddingPurchases.def, _)):
      developer.log('${StatusOfAddingPurchases.brk}');
      break;
    case (StatusOfAddingPurchases.rem, Purchase data):
      developer.log('${StatusOfAddingPurchases.rem}');
      PurchasesList.rem(id, data.group);
      break;
    case (StatusOfAddingPurchases.mod, Purchase data):
      developer.log('${StatusOfAddingPurchases.mod}');
      PurchasesList.mod(id, data);
      break;
    case null:
      developer.log('null');
      break;
  }
}