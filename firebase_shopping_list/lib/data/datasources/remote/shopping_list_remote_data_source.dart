
import 'package:firebase_shopping_list/core/core.dart';
import 'package:firebase_shopping_list/data/data.dart';

abstract class ShoppingListRemoteDataSource extends AllRepository{

  Stream<List<PurchasesListModel>> getAll({required bool sortFilter, required bool buyFilter});

}