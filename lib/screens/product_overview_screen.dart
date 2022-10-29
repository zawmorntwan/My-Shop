import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../widgets/badge.dart';
import '../widgets/product_grid.dart';
import 'cart_screen.dart';

enum FliterOptions {
  favorite,
  all,
}

class ProductOverviewScreen extends StatefulWidget {
  const ProductOverviewScreen({Key? key}) : super(key: key);

  @override
  State<ProductOverviewScreen> createState() => _ProductOverviewScreenState();
}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showFavoritesOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Shop'),
        actions: [
          Consumer<Cart>(
            builder: (_, cartData, ch) {
              if (cartData.itemCount == 0) {
                return IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.route);
                  },
                );
              } else {
                return Badge(
                  value: cartData.itemCount.toString(),
                  child: ch!,
                );
              }
            },
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.route);
              },
            ),
          ),
          PopupMenuButton(
            onSelected: (FliterOptions selectedValue) {
              setState(() {
                if (selectedValue == FliterOptions.favorite) {
                  _showFavoritesOnly = true;
                } else {
                  _showFavoritesOnly = false;
                }
              });
            },
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FliterOptions.favorite,
                child: Text('Only favorites'),
              ),
              const PopupMenuItem(
                value: FliterOptions.all,
                child: Text('Show all'),
              )
            ],
          ),
        ],
      ),
      body: ProductGrid(_showFavoritesOnly),
    );
  }
}
