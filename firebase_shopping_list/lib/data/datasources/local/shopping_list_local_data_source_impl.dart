
import 'package:firebase_shopping_list/data/data.dart';

class ShoppingListLocalDataSourceImpl extends ShoppingListLocalDataSource {

  List<PurchasesListModel> purchasesListModel = [];




  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}