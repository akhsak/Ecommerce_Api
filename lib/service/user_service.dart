import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/service/store_service.dart';

class UserService {
  String? userStatusCode;
  String? createdStatusCode;
  Dio dio = Dio();
  StoreService store = StoreService();

  Future<bool> createUser(UserModel userInfo) async {
    const url = 'http://localhost:9000/api/users/register';
    try {
      Response response = await dio.post(url, data: userInfo.toJson());
      createdStatusCode = response.statusCode.toString();

      if (response.statusCode == 201) {
         log('Account created');
        return true;
      } else {
        log("Account not created. Status code: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      log("error message: $e");
      return false;
    }
  }

  Future<bool> userLogin(UserModel userInfo) async {
    const url = 'http://localhost:9000/api/users/login';
    try {
      Response response = await dio.post(url, data: userInfo.toJson());
      userStatusCode = response.statusCode.toString();

      if (response.statusCode == 200) {
        log('User Logged in');
        final tokenId = response.data['token'];
        final userId = response.data['data']['user']['_id'];
        final username = response.data['data']['user']['username'];
        final password = response.data['data']['user']['password'];

        store.setKeys('tokenId', tokenId);
        store.setKeys('userId', userId);
        store.setKeys('username', username);
        store.setKeys('password', password);

        return true;
      } else {
        log('User login failed. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      log(" error meassage: $e");
      return false;
    }
  }
}
