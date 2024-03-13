import 'package:ecommerce_app/controller/bottom_provider.dart';
import 'package:ecommerce_app/controller/product_provider.dart';
import 'package:ecommerce_app/controller/search_provider.dart';
import 'package:ecommerce_app/controller/store_provider.dart';
import 'package:ecommerce_app/controller/user_provider.dart';
import 'package:ecommerce_app/controller/wishlist_provider.dart';
import 'package:ecommerce_app/welcome/splash_screen.dart';
import 'package:ecommerce_app/widget/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) =>BottomProvider()),
      ChangeNotifierProvider(create: (context)=>UserProvider()),
      ChangeNotifierProvider(create: (context)=>StoreProvider()),
      ChangeNotifierProvider(create: (context)=>ProductProvider()),
      ChangeNotifierProvider(create: (context)=>WishListProvider()),
      ChangeNotifierProvider(create: (context)=>SearchProvider()) 
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       // home:SplashScreen() ,
       home: Bottombar(),
      ),
    );
  }
}

