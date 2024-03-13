import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/model/wishlist_model.dart';

class WishListService {
  Dio dio = Dio();
  String? wishListStatuscode;
  addToWishList(WishListModel product, String userId) async {
    final url = 'http://localhost:9000/api/users/$userId/wishlist';

    try {
      Response response = await dio.post(
        url,
        data: product.toJson()['data'],
        // options: Options(
        //   headers: product.toJson(token)['headers'],
        // ),
      );

      if (response.statusCode == 200) {
        wishListStatuscode = '200';
        log('Product added to WishList');
      } else if (response.statusCode == 500) {
        log('Unsuccessful. Status code: ${response.statusCode}');
        log('Response data: ${response.data}');
      }
    } catch (e) {
      log('ErrorFromToWishList: $e');
      wishListStatuscode = '500';
    }
  }

  getWishListProduct( String userId,) async {
    final url = 'http://localhost:9000/api/users/$userId/wishlist';

    try {
      Response response = await dio.get(
        url,
        
      );

      if (response.statusCode == 200) {
        final List<dynamic> product = response.data['data'] as List;

        return product;
      } else {
        log('Unsuccessful. Status code: ${response.statusCode}');
        log('Response data: ${response.data}');
        throw Exception('Failed to fetch wishlist');
      }
    } catch (e) {
      rethrow;
    }
  }

  deleteFromWishList(String productId, String userId, String token) async {
    final url = 'http://localhost:9000/api/users/$userId/wishlist';

    try {
      Response response = await dio.delete(
        url,
        // options: Options(
        //   headers: {
        //     'Authorization': 'Bearer $token',
        //   },
        // ),
      );

      if (response.statusCode == 200) {
        log('Product deleted from WishList');
      } else if (response.statusCode == 500) {
        log('Unsuccessful. Status code: ${response.statusCode}');
        log('Response data: ${response.data}');
      }
    } catch (e) {
      log('Error deleting product from WishList: $e');
    }
  }
}