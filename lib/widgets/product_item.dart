import 'package:flutter/material.dart';
import 'package:my_shop/screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  const ProductItem(this.id, this.title, this.imageUrl, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {},
          ),
          title: Text(
            title,
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
              arguments: id,
            );
          },
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
