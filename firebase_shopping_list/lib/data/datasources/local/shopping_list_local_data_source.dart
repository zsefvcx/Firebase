
import 'package:firebase_shopping_list/core/core.dart';
import 'package:firebase_shopping_list/data/data.dart';

abstract class ShoppingListLocalDataSource extends AllRepository{

  Future<List<PurchasesListModel>> getAll({required bool sortFilter, required bool buyFilter});

}