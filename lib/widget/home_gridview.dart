// ignore_for_file: prefer_typing_uninitialized_variables


import 'dart:developer';

import 'package:ecommerce_app/controller/store_provider.dart';
import 'package:ecommerce_app/controller/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ProductContainer extends StatelessWidget {
  final product;
  final productId;

  const ProductContainer({Key? key, this.product, this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: mediaQuery.size.width * 0.3,
              width: mediaQuery.size.width * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(
                    product.image.toString(),
                  ),
                ),
              ),
            ),
          ),
          Text(
            product.title ?? 'Unknown',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            product.category ?? 'Unknown',
            style: TextStyle(
              color: product.category == 'men' ? Colors.blue : Colors.pink,
              fontSize: 12,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹ ${product.price.toString()}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              IconButton(
                onPressed: () async {
                  toWishList(context, productId);
                },
                icon: const Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future toWishList(context, product) async {
    final store = Provider.of<StoreProvider>(context, listen: false);
    final userId = await store.getValues('userId');
    final token = await store.getValues('tokenId');
    final wishProvider = Provider.of<WishListProvider>(context, listen: false);

    if (userId != null && token != null) {
      wishProvider.addToWishList(product, userId, token);
      if (wishProvider.wishListStatuscode == '200') {
        log("Product added to Wishlist");
      } else if (wishProvider.wishListStatuscode == '500') {
        log('Product already in wishlist');
      }
    } else {
      log('Your are not loged in ');
    }
  }

  Future toWishLis(context, productId) async {
    final store = Provider.of<StoreProvider>(context, listen: false);
    final userId = await store.getValues('userId');
    final token = await store.getValues('tokenId');
    final wishProvider = Provider.of<WishListProvider>(context, listen: false);

    if (userId != null && token != null) {
      wishProvider.addToWishList(productId.id, userId,
          token); // Pass productId.id instead of productId
      if (wishProvider.wishListStatuscode == '200') {
        log("Product added to Wishlist");
      } else if (wishProvider.wishListStatuscode == '500') {
        log('Product already in wishlist');
      }
    } else {
      log('You are not logged in');
    }
 }
}