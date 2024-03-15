import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/service/product_service.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  ProductService apiService = ProductService();
  List<ProductModel> productList = [];
  bool isLoading = false;

  void getData() async {
    isLoading = true;
    try {
      productList = await apiService.getData();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      rethrow;
    }
  }
}
