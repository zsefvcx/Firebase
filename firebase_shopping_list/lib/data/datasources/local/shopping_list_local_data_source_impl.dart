
import 'package:firebase_shopping_list/data/data.dart';

class ShoppingListLocalDataSourceImpl extends ShoppingListLocalDataSource {

  List<PurchasesListModel> purchasesListModel = [];

  @override
  void init(){
    purchasesListModel.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  bool isBusy() {
    // TODO: implement isBusy
    return true;
    //throw UnimplementedError();
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}