import 'package:ecommerce_app/controller/bottom.provider.dart';
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
    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Bottombar() ,
      ),
    );
  }
}

