import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import 'product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavorite;
  const ProductGrid(
    this.showFavorite, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(showFavorite.toString()); 
    
    final productsData = Provider.of<Products>(context);
    log(productsData.favoriteItems.toString());
    final products =
        showFavorite ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: const ProductItem(),
      ),
    );
  }
}
