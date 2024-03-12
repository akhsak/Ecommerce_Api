import 'package:ecommerce_app/model/wishlist_model.dart';
import 'package:ecommerce_app/service/wishlist_service.dart';
import 'package:flutter/material.dart';


class WishListProvider extends ChangeNotifier {
  final WishListService _wishListService = WishListService();
  List wishListItemId = [];
  String? wishListStatuscode;
  Future<void> addToWishList(
      String productId, String userId, String token) async {
    final product = WishListModel(id: productId);
    await _wishListService.addToWishList(product, userId, token);

    wishListStatuscode = _wishListService.wishListStatuscode;
    notifyListeners();
  }

  Future<void> getWishListProduct(String userId, String token) async {
    final product = WishListModel();
    wishListItemId =
        await _wishListService.getWishListProduct(product, userId, token);
    notifyListeners();
  }

  Future<void> deleteFromWishList(
      String productId, String userId, String token) async {
    await _wishListService.deleteFromWishList(productId, userId, token);
    notifyListeners();
  }
}