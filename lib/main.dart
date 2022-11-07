import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products.dart';
import './providers/cart.dart';
import 'providers/orders.dart';
import 'screens/cart_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/product_detail_screen.dart';
import 'screens/product_overview_screen.dart';
import 'screens/user_products_screen.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProvider(create: (ctx) => Orders()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: getTheme(),
        home: const ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.route: (context) => const ProductDetailScreen(),
          CartScreen.route: (context) => const CartScreen(),
          OrdersScreen.route: (context) => const OrdersScreen(),
          UserProductsScreen.route: (context) => const UserProductsScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
