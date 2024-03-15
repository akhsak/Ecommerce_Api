import 'dart:developer';

import 'package:ecommerce_app/controller/store_provider.dart';
import 'package:ecommerce_app/controller/wishlist_provider.dart';
import 'package:ecommerce_app/model/product_model.dart';
import 'package:ecommerce_app/model/wishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductContainer extends StatelessWidget {
  final ProductModel? product;

  const ProductContainer({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    final wishProvider = Provider.of<WishListProvider>(context, listen: false);
    final mediaQuery = MediaQuery.of(context);
    final isAddedToWishlist =
        wishProvider.wishListItemId.any((element) => element.id == product!.id);

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
                    product!.image.toString(),
                  ),
                ),
              ),
            ),
          ),
          Text(
            product!.title ?? 'Unknown',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            product!.category ?? 'Unknown',
            style: TextStyle(
              color: product!.category == 'product' ? Colors.blue : Colors.pink,
              fontSize: 12,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₹ ${product!.price.toString()}',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              Consumer<WishListProvider>(
                builder: (context, value, child) => IconButton(
                  onPressed: () async {
                    if (isAddedToWishlist) {
                      await value.deleteFromWishList(
                          product!.id as WishListModel, 'userId');
                    } else {
                      toWishList(context, product!.id);
                    }
                  },
                  icon: isAddedToWishlist
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_outline,
                          color: Colors.black,
                        ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Future<void> toWishList(context, productId) async {
    final store = Provider.of<StoreProvider>(context, listen: false);
    final userId = await store.getValues('userId');
    final token = await store.getValues('tokenId');
    final wishProvider = Provider.of<WishListProvider>(context, listen: false);

    if (userId != null && token != null) {
      await wishProvider.addToWishList(productId, userId);
      if (wishProvider.wishListStatuscode == '200') {
        log("Product added to Wishlist");
      } else if (wishProvider.wishListStatuscode == '500') {
        log('Product already in wishlist');
      }
    } else {
      log('Your are not logged in ');
    }
  }
}
