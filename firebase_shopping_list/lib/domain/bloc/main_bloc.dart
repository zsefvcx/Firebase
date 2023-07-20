
import 'dart:async';

import 'package:firebase_shopping_list/core/core.dart';
import 'package:firebase_shopping_list/domain/domain.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'main_bloc.freezed.dart';

@freezed
class MainBlocState with _$MainBlocState{
  const factory MainBlocState.loading() = _loadingState;
  const factory MainBlocState.loaded({required List<PurchasesListEntities> data}) = _loadedState;
  const factory MainBlocState.error() = _errorState;
  const factory MainBlocState.timeOut() = _timeOut;
  const factory MainBlocState.isBusy() = _isBusy;

}

@freezed
class MainBlocEvent with _$MainBlocEvent{
  const factory MainBlocEvent.init({required bool sortFilter, required bool buyFilter}) = _initEvent;
  const factory MainBlocEvent.getAll({required bool sortFilter, required bool buyFilter}) = _getAllEvent;
  const factory MainBlocEvent.add({required Purchase data}) = _addEvent;
  const factory MainBlocEvent.get({required String id}) = _getEvent;
  const factory MainBlocEvent.getLength({required String id}) = _getLengthEvent;
  const factory MainBlocEvent.mod({required String id, required Purchase data}) = _modEvent;
  const factory MainBlocEvent.rem({required String id, required bool grp}) = _remEvent;
  const factory MainBlocEvent.remAll() = _remAllEvent;
}

@injectable
class MainBloc{
  final ShoppingListRepository shoppingListRepository;

  final StreamController<MainBlocEvent> _eventsController = StreamController();
  final StreamController<MainBlocState> _stateController = StreamController.broadcast();

  //Stream<List<PurchasesListEntities>> _data = const Stream.empty();

  Stream<MainBlocState> get state => _stateController.stream;

  MainBloc({
     required this.shoppingListRepository,
   }) {
    _eventsController.stream.listen((event) {
      event.map<void>(
          init: (_initEvent value) async {
            _stateController.add(const MainBlocState.loading());
            List<PurchasesListEntities> data = await _getAll(
                sortFilter: value.sortFilter,
                buyFilter: value.buyFilter,
            );
            _stateController.add(MainBlocState.loaded(data: data));
          },
          getAll: (_getAllEvent value) {
            _stateController.add(const MainBlocState.loading());
            // _data = _getAll(
            //   sortFilter: value.sortFilter,
            //   buyFilter: value.buyFilter,
            // );
            // _stateController.add(MainBlocState.loaded(data: data));
          },
          add: (_addEvent value) async {
            _stateController.add(const MainBlocState.loading());
            await _add(value.data);
            // _stateController.add(MainBlocState.loaded(data: data));
          },
          get: (_getEvent value) {

          },
          getLength: (_getLengthEvent value) {

          },
          mod: (_modEvent value) async {
            _stateController.add(const MainBlocState.loading());
            await _mod(value.id, value.data);
            // _stateController.add(MainBlocState.loaded(data: data));
          },
          rem: (_remEvent value) async {
            _stateController.add(const MainBlocState.loading());
            await _rem(value.id, value.grp);
            // _stateController.add(MainBlocState.loaded(data: data));
          },
          remAll: (_remAllEvent value) async {
            _stateController.add(const MainBlocState.loading());
            await _remAll();
            // _stateController.add(MainBlocState.loaded(data: data));
          }





          // init: (value) async {
          //
          //   _stateController.add(const MainBlocState.loading());
          //   await _getAllProducts(0);
          //   _stateController.add(MainBlocState.loaded(model: mainModel));
          // },
          // getAllProducts: (value) async {
          //   if(featureRepository.isBusy()) return;
          //   _stateController.add(const MainBlocState.loading());
          //   await _getAllProducts(value.page);
          //   if (mainModel.isTimeOut){
          //     _stateController.add(const MainBlocState.timeOut());
          //   } else if (mainModel.isError){
          //     _stateController.add(const MainBlocState.error());
          //   } else {
          //     _stateController.add(MainBlocState.loaded(model: mainModel));
          //   }
          //
          // },
          // searchProduct: ( value) async {
          //   if(featureRepository.isBusy()) return;
          //   _stateController.add(const MainBlocState.loading());
          //   await _searchProduct(value.id);
          //   if (mainModel.isTimeOut){
          //     _stateController.add(const MainBlocState.timeOut());
          //   } else if (mainModel.isError){
          //     _stateController.add(const MainBlocState.error());
          //   } else {
          //     _stateController.add(MainBlocState.loaded(model: mainModel));
          //   }
          // }
      );
    });
  }

  void addEvent(MainBlocEvent event){
    if(_eventsController.isClosed) return;
    _eventsController.add(event);
  }

  void dispose(){
    shoppingListRepository.dispose();
    _eventsController.close();
    _stateController.close();
  }

  Future<List<PurchasesListEntities>> _getAll({
    required bool sortFilter,
    required bool buyFilter,
  }) async {
    return await shoppingListRepository.getAll(
        sortFilter: sortFilter,
        buyFilter: buyFilter,
    );
  }

  Future<void> _add(Purchase data) async {
    await shoppingListRepository.add(data);
  }

  Future<Purchase?> get(String id) async {
    return await shoppingListRepository.get(id);
  }

  bool isBusy() {
    return shoppingListRepository.isBusy();
  }

  Future<int> get length async => await shoppingListRepository.length;

  Future<void> _mod(String id, Purchase data) async {
    await shoppingListRepository.mod(id, data);
  }

  Future<void> _rem(String id, bool grp) async {
    await shoppingListRepository.rem(id, grp);
  }

  Future<void> _remAll() async {
    await shoppingListRepository.remAll();
  }
  //
  // Future<void> _getAllProducts(int page) async {
  //   var(Failure? e , List<ProductEntity>? lp, bool timeOut) = await _getProduct(() => featureRepository.getAllProducts(page));
  //   if(lp!=null){mainModel = mainModel.copyWith(error: false, timeOut: false,   e: '', lpAll: lp,); return;}
  //   if(e !=null){mainModel = mainModel.copyWith(error: true,  timeOut: timeOut,e: e.runtimeType.toString());
  //   return;
  //   }
  // }
  //
  // Future<void> _searchProduct(int id) async {
  //   var(Failure? e , List<ProductEntity>? lp, bool timeOut) = await _getProduct(() => featureRepository.searchProduct(id));
  //   if(lp!=null){mainModel = mainModel.copyWith(error: false, timeOut: false,   e: '', lpSingle: lp,);return;}
  //   if(e!=null){mainModel = mainModel.copyWith(error: true,  timeOut: timeOut,e: e.runtimeType.toString());
  //   return;
  //   }
  // }
  //
  // Future<(Failure?, List<ProductEntity>?, bool)> _getProduct(Future<(Failure?, List<ProductEntity>?)> Function() getProducts) async {
  //   try {
  //     mainModel = mainModel.copyWith(e: '', timeOut: false, error: false, lpSingle: [], lpAll: []);
  //     bool timeOut = false;
  //     var (Failure? e, List<ProductEntity>? lp) = await getProducts()
  //         .timeout(const Duration(seconds: 5),
  //         onTimeout: () {
  //           timeOut  = true;
  //           return ( MainBlocFailure(),  null);
  //         });
  //
  //     if (lp != null) {
  //       return (null, lp, false);
  //     }
  //     if (e != null) {
  //       return (e, null, timeOut);
  //     }
  //   } catch (e){//все ошибки отловим
  //     //что то тут сделаем но потом...
  //     return ( MainBlocFailure(),  null, false);
  //   }
  //   return (null ,null, false);//что то пошло не так
  // }
}