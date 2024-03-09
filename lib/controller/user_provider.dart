import 'package:ecommerce_app/model/user_model.dart';
import 'package:ecommerce_app/service/store_service.dart';
import 'package:ecommerce_app/service/user_service.dart';
import 'package:flutter/material.dart';


class UserProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final UserService _userService = UserService();
  final StoreService _storeService = StoreService();

  String? userStatusCode;
  String? createdStatusCode;

  String username = '';
  String password = '';

  Future<void> createUser(UserModel userInfo) async {
    await _userService.createUser(userInfo);
    createdStatusCode = _userService.createdStatusCode;
    notifyListeners();
  }

  Future<void> userLogin(UserModel userInfo) async {
    await _userService.userLogin(userInfo);
    userStatusCode = _userService.userStatusCode;
    notifyListeners();
  }

  Future<void> setUserData() async {
    username = await _storeService.getValues('username') ?? '';
    password = await _storeService.getValues('password') ?? '';
    notifyListeners();
  }
}