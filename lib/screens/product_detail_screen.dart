import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  static const route = '/product-detail';
  
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
      ),
    );
  }
}