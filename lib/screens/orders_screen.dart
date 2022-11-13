import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../providers/orders.dart';
import '../widgets/app_drawer.dart';
import '../widgets/order_card.dart';

class OrdersScreen extends StatefulWidget {
  static const route = '/orders';
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  var _isLoading = false;
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your orders'),
      ),
      drawer: const AppDrawer(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: primaryColor),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: orderData.orders.length,
              itemBuilder: (ctx, i) => OrderCard(orderData.orders[i]),
            ),
    );
  }
}
