
import 'package:firebase_shopping_list/core/core.dart';

abstract class ShoppingListRepository {

  Future<void> mod(String id, Purchase data);

  Future<void> rem(String id, bool grp);

  Future<void> remAll();

  Future<void> add(Purchase data);

  Future<Purchase?> get(String id);

  Future<int> get length;

  void init();

  void dispose();

  bool isBusy();
}
