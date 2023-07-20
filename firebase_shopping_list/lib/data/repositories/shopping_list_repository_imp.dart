
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
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}