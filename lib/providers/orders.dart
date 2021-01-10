import 'package:flutter/material.dart';

import './cart.dart';

class OrderItem {
  final String id;
  final double value;
  final List<CartItem> products;
  final DateTime dateTime;

  const OrderItem(
    this.id,
    this.value,
    this.products,
    this.dateTime,
  );
}

class Order with ChangeNotifier {
  List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return _orders;
  }

  void addOrder(List<CartItem> cartItems, double value) {
    _orders.insert(
        0,
        OrderItem(
          DateTime.now().toString(),
          value,
          cartItems,
          DateTime.now(),
        ));

    notifyListeners();
  }
}
