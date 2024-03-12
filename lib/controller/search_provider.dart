import 'package:ecommerce_app/controller/product_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/service/product_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SearchProvider extends ChangeNotifier {
  ProductService productService = ProductService();
  TextEditingController searchController = TextEditingController();
  List<ProductModel> searchedList = [];

  void search(String enterName, context) {
    final getProductProvider =
        Provider.of<ProductProvider>(context, listen: false);
    if (enterName.isEmpty) {
      searchedList = [];
    } else {
      searchedList = getProductProvider.productList
          .where((ProductModel product) =>
              product.title!.toLowerCase().contains(enterName.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}