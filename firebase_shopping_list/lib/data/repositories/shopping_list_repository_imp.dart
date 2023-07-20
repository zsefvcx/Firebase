
import 'package:firebase_shopping_list/domain/domain.dart';

class ShoppingListRepositoryImpl extends ShoppingListRepository {


  @override
  Future<void> add(Purchase data) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<Purchase?> get(String id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  void init() {
    purchases = [];
  }

  @override
  bool isBusy() {
    // TODO: implement isBusy
    throw UnimplementedError();
  }

  @override
  // TODO: implement length
  Future<int> get length => throw UnimplementedError();

  @override
  Future<void> mod(String id, Purchase data) {
    // TODO: implement mod
    throw UnimplementedError();
  }

  @override
  Future<void> rem(String id, bool grp) {
    // TODO: implement rem
    throw UnimplementedError();
  }

  @override
  Future<void> remAll() {
    // TODO: implement remAll
    throw UnimplementedError();
  }

}