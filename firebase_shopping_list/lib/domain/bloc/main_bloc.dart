import 'dart:developer' as developer;

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
  const factory MainBlocEvent.init() = _initEvent;
  const factory MainBlocEvent.getAll({required bool sortFilter, required bool buyFilter}) = _getAllEvent;
  const factory MainBlocEvent.add({required Purchase data}) = _addEvent;
  const factory MainBlocEvent.mod({required String id, required Purchase data}) = _modEvent;
  const factory MainBlocEvent.rem({required String id, required bool grp}) = _remEvent;
  const factory MainBlocEvent.remAll() = _remAllEvent;
}

@injectable
class MainBloc{
  final ShoppingListRepository shoppingListRepository;

  final StreamController<MainBlocEvent> _eventsController = StreamController();
  final StreamController<MainBlocState> _stateController = StreamController.broadcast();

  StreamSubscription? _streamSubscriptionData;
  Stream<List<PurchasesListEntities>> _data = const Stream.empty();

  Stream<MainBlocState> get state => _stateController.stream;

  bool buyFilter = true;
  bool sortFilter = true;

  MainBloc({
     required this.shoppingListRepository,
   }) {
    _eventsController.stream.listen((event) {
      event.map<void>(
          init: (_initEvent value) async {
            _stateController.add(const MainBlocState.loading());
            _getAll(
                sortFilter: sortFilter,
                buyFilter: buyFilter,
            );
          },
          getAll: (_getAllEvent value) async {
            sortFilter = value.sortFilter;
            buyFilter = value.buyFilter;
            //_stateController.add(const MainBlocState.loading());
            _getAll(
              sortFilter: sortFilter,
              buyFilter: buyFilter,
            );
          },
          add: (_addEvent value) async {
            //_stateController.add(const MainBlocState.loading());
            await _add(value.data);
            _getAll(
              sortFilter: sortFilter,
              buyFilter: buyFilter,
            );
          },
          mod: (_modEvent value) async {
            //_stateController.add(const MainBlocState.loading());
            await _mod(value.id, value.data);
            _getAll(
              sortFilter: sortFilter,
              buyFilter: buyFilter,
            );
          },
          rem: (_remEvent value) async {
            //_stateController.add(const MainBlocState.loading());
            await _rem(value.id, value.grp);
            _getAll(
              sortFilter: sortFilter,
              buyFilter: buyFilter,
            );
          },
          remAll: (_remAllEvent value) async {
            //_stateController.add(const MainBlocState.loading());
            await _remAll();
            _getAll(
              sortFilter: sortFilter,
              buyFilter: buyFilter,
            );
          }
      );
    });
  }

  void addEvent(MainBlocEvent event){
    if(_eventsController.isClosed) return;
    _eventsController.add(event);
  }

  void dispose(){
    _streamSubscriptionData?.cancel();
    shoppingListRepository.dispose();
    _eventsController.close();
    _stateController.close();
  }

  Future<void> _getAll({
    required bool sortFilter,
    required bool buyFilter,
  }) async {
    try {// пока так...
      _data = shoppingListRepository.getAll(
        sortFilter: sortFilter,
        buyFilter: buyFilter,
      );

      _streamSubscriptionData?.cancel();
      _streamSubscriptionData = _data
          .timeout(
            const Duration(seconds: 5),
            onTimeout: (sink) => _stateController.add(
                const MainBlocState.timeOut()
            ),
          )
          .listen((data) {
        _stateController.add(MainBlocState.loaded(data: data));
      });
    } catch(e, t){
      developer.log('$e\n$t');
      _stateController.add(const MainBlocState.error());
    }
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

}