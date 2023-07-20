
import 'package:firebase_shopping_list/core/core.dart';
import 'package:firebase_shopping_list/domain/domain.dart';

abstract class ShoppingListRepository extends AllRepository {

  Future<List<PurchasesListEntities>> getAll({required bool sortFilter, required bool buyFilter});

}
