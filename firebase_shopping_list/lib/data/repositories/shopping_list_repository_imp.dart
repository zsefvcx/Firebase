
import 'package:firebase_shopping_list/core/purchases.dart';
import 'package:firebase_shopping_list/data/data.dart';
import 'package:firebase_shopping_list/domain/domain.dart';

class ShoppingListRepositoryImpl extends ShoppingListRepository {

  final ShoppingListLocalDataSource shoppingListLocalDataSource;
  final ShoppingListRemoteDataSource shoppingListRemoteDataSource;

  ShoppingListRepositoryImpl({
    required this.shoppingListLocalDataSource,
    required this.shoppingListRemoteDataSource,
  });

  @override
  Future<void> add(Purchase data) async {
    await shoppingListRemoteDataSource.add(data);
  }

  @override
  void dispose() {
    shoppingListRemoteDataSource.dispose();
  }

  @override
  Future<Purchase?> get(String id) async {
    return await shoppingListRemoteDataSource.get(id);
  }

  @override
  void init() async {
    shoppingListRemoteDataSource.init();
  }

  @override
  bool isBusy() {
    return shoppingListRemoteDataSource.isBusy();
  }

  @override
  Future<int> get length async => await shoppingListRemoteDataSource.length;

  @override
  Future<void> mod(String id, Purchase data) async {
    await shoppingListRemoteDataSource.mod(id, data);
  }

  @override
  Future<void> rem(String id, bool grp) async {
    await shoppingListRemoteDataSource.rem(id, grp);
  }

  @override
  Future<void> remAll() async {
    await shoppingListRemoteDataSource.remAll();
  }

  @override
  Stream<List<PurchasesListEntities>> getAll({required bool sortFilter, required bool buyFilter}) {
    return shoppingListRemoteDataSource.getAll(sortFilter: sortFilter, buyFilter: buyFilter);
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}