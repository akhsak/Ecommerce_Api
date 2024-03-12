import 'package:ecommerce_app/widget/cart_item.dart';
import 'package:ecommerce_app/widget/text_widget.dart';
import 'package:flutter/material.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 22, left: 12, right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textAbel(data: 'Cart', size: 20, weight: FontWeight.bold),
                      const SizedBox(width: 8),
                      const Icon(
                        Icons.shopping_cart_outlined,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return const CartItem();
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}