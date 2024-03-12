import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        
        actions: [
          IconButton(onPressed: (){}, icon:Icon(Icons.search),),
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart))
        ],
      ) ,
    );
  }
}