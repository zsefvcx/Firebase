
import 'package:firebase_shopping_list/core/core.dart';
import 'package:firebase_shopping_list/domain/domain.dart';

class PurchasesListModel extends PurchasesListEntities {

  PurchasesListModel({required String id, required Purchase purchase}) :
      super(id: id, purchase: purchase);


}