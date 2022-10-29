import 'package:flutter/material.dart';
import 'package:my_shop/screens/cart_screen.dart';
import 'package:my_shop/screens/product_detail_screen.dart';
import 'package:my_shop/screens/product_overview_screen.dart';
import 'package:my_shop/theme.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';
import './providers/cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create : (ctx) => Products()),
        ChangeNotifierProvider(create : (ctx) => Cart())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: getTheme(),
        home: const ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.route: (context) => const ProductDetailScreen(),
          CartScreen.route: (context) => const CartScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
