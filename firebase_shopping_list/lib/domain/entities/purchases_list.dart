
import 'package:firebase_shopping_list/core/core.dart';

class PurchasesList {
  static final Map<int, Purchase> _purchases = {};
  static final Map<int, Purchase> _group = {};//Деления пока не реализовано да пока ненадо...

  static int get length => _purchases.length + _group.length;//пока так...

  static Purchase? get(int id) => _purchases[id];

  static bool add(Purchase data) {
    int id = data.id;
    bool grp = data.group;
    if(grp == true && _group[id]==null) {
      _group[id]=data;
      return true;
    } else if(grp == false && _purchases[id]==null) {
      _purchases[id]=data;
      return true;
    }
    return false;
  }

  static remAll() {
    _purchases.clear();
    _group.clear();
  }

  static bool rem(int id, bool grp) {
    if(grp == true && _group[id]!=null) {
      _group.remove(id);
      return true;
    }else if(grp == false && _purchases[id]!=null) {
      _purchases.remove(id);
      return true;
    }
    return false;
  }

  static bool mod(Purchase data) {
    int id = data.id;
    bool grp = data.group;
    if(grp == true && _group[id]!=null) {
      _group[id]=data;
      return true;
    } else if(grp == false && _purchases[id]!=null) {
      _purchases[id]=data;
      return true;
    }
    return false;
  }

  static void fromJson(dynamic data){
    if (data is List<dynamic>){
      for (var element in data) {
        if (element is Map<String, dynamic>){
          if (element['id'] is int) {
            int id = element['id'] as int;
            bool grp = element['group'] as bool;
            if (grp == true && _group[id] == null){
              _group[id] = Purchase.fromJson(element);
            } else if (grp == false && _purchases[id] == null) {
              _purchases[id] = Purchase.fromJson(element);
            }
          }
        }
      }
    }
  }

  @override
  String toString() {
    return _purchases.toString();
  }
}