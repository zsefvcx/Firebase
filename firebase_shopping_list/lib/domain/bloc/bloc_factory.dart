

import 'package:get_it/get_it.dart';

class BlocFactory {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = BlocFactory();

  void initialize(){
    // ServiceProvider.instance.initialize();
    //
    // _getIt.registerLazySingleton<MainBloc>(
    //      () => MainBloc(
    //       featureRepository:  ServiceProvider.instance.get<FeatureRepository>(),
    //      ),
    // );
    //
    // _getIt.registerLazySingleton<FavoritesBloc>(
    //       () => FavoritesBloc(
    //     favoritesRepository: ServiceProvider.instance.get<FavoritesRepository>(),
    //   ),
    // );
    //
    // _getIt.registerLazySingleton<ShoppingBasketBloc>(
    //       () => ShoppingBasketBloc(
    //     shoppingBasketRepository: ServiceProvider.instance.get<ShoppingBasketRepository>(),
    //   ),
    // );
  }


}