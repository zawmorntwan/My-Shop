import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: primaryColor,
              ),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {},
          ),
          backgroundColor: Colors.black87,
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.route,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
