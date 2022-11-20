import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products.dart';
import './providers/cart.dart';
import 'constants.dart';
import 'providers/auth.dart';
import 'providers/orders.dart';
import 'screens/auth_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/edit_product_screen.dart';
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
        ChangeNotifierProvider(create: (ctx) => Auth()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (ctx) => Orders('','', []),
          update: (ctx, auth, previousOrders) => Orders(
            auth.token,
            auth.userId!,
            previousOrders == null ? [] : previousOrders.orders,
          ),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (ctx) => Products('','', []),
          update: (ctx, auth, previousProducts) => Products(
            auth.token,
            auth.userId!,
            previousProducts == null ? [] : previousProducts.items,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: appName,
          theme: getTheme(),
          home:
              auth.isAuth ? const ProductOverviewScreen() : const AuthScreen(),
          routes: {
            ProductDetailScreen.route: (context) => const ProductDetailScreen(),
            CartScreen.route: (context) => const CartScreen(),
            OrdersScreen.route: (context) => const OrdersScreen(),
            UserProductsScreen.route: (context) => const UserProductsScreen(),
            EditProductScreen.route: (context) => const EditProductScreen(),
          },
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
