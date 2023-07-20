
import 'package:firebase_shopping_list/domain/domain.dart';
import 'package:get_it/get_it.dart';

import 'data.dart';

class ServiceProvider{
  static final _getIt = GetIt.I;

  final ShoppingListRemoteDataSource shoppingListRemoteDataSource = ShoppingListRemoteDataSourceImpl();
  final ShoppingListLocalDataSource shoppingListLocalDataSource = ShoppingListLocalDataSourceImpl();

  //final NetworkInfo networkInfo = NetworkInfoImp(internetConnectionChecker: InternetConnectionChecker());

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = ServiceProvider();

  void initialize(){
    shoppingListRemoteDataSource.init();
    shoppingListLocalDataSource.init();
    _getIt.registerLazySingleton<ShoppingListRepository>(
          () => ShoppingListRepositoryImpl(//networkInfo: networkInfo,
        shoppingListLocalDataSource: shoppingListLocalDataSource,
        shoppingListRemoteDataSource: shoppingListRemoteDataSource,
      ),
    );
  }
}