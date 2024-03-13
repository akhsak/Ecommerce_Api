import 'package:ecommerce_app/service/store_service.dart';
import 'package:flutter/material.dart';

class StoreProvider extends ChangeNotifier {
  StoreService store = StoreService();

  Future<dynamic> getValues(key) async {
    return store.getValues(key);
  }

  void clearValues() async {
    await store.clearValues();
    notifyListeners();
  }
}
