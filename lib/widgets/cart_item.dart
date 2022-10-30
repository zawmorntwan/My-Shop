import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  const CartItem(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.title,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('\$ $price'),
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total \$ ${price * quantity}'),
          trailing: Text('$quantity X'),
        ),
      ),
    );
  }
}
