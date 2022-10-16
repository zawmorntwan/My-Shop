import 'package:flutter/material.dart';
import 'package:my_shop/screens/product_overview_screen.dart';
import 'package:my_shop/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: getTheme(),
      home: ProductOverviewScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}