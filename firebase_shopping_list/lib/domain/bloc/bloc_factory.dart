

import 'package:firebase_shopping_list/data/service_provider.dart';
import 'package:firebase_shopping_list/domain/domain.dart';
import 'package:get_it/get_it.dart';

import 'main_bloc.dart';

class BlocFactory {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = BlocFactory();

  void initialize(){
    ServiceProvider.instance.initialize();
    _getIt.registerLazySingleton<MainBloc>(
         () => MainBloc(
          shoppingListRepository:  ServiceProvider.instance.get<ShoppingListRepository>(),
         ),
    );
  }
}