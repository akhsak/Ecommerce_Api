import 'package:ecommerce_app/widget/text_widget.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: mediaQuery.height * 0.2,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color(0xFF202020),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                width: mediaQuery.width * .2,
                height: mediaQuery.height * .1,
                margin: const EdgeInsets.only(right: 5),
                child: Image.asset(
                  '',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    textAbel(
                        data: 'Product Title',
                        size: 15,
                        weight: FontWeight.w300),
                    textAbel(data: '\$500', size: 12, weight: FontWeight.w200)
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}