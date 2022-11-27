import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const route = '/product-detail';

  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(loadedProduct.title),
      //   centerTitle: true,
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(loadedProduct.title),
              background: Hero(
                tag: loadedProduct.id,
                child: Image.network(
                  loadedProduct.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Text(
                  '\$ ${loadedProduct.price}',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    loadedProduct.description,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: 800,)
              ],
            ),
          )
        ],
        physics: const BouncingScrollPhysics(),
      ),
    );
  }
}
