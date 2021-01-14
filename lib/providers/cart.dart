import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final double price;
  final int quantity;
  final String title;

  CartItem({
    @required this.id,
    @required this.price,
    @required this.quantity,
    @required this.title,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return _cartItems;
  }

  void addItem(String productId, String title, double price) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
              ));
    } else
      _cartItems.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    notifyListeners();
  }

  int get cartQuantity {
    return _cartItems.length;
  }

  double get cartValue {
    double totalValue = 0.0;

    _cartItems.forEach((key, cartItem) {
      totalValue += cartItem.price * cartItem.quantity;
    });

    return totalValue;
  }

  void removeProduct(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _cartItems = {};
    notifyListeners();
  }

  void removeItem(String productId) {
    if (!_cartItems.containsKey(productId))
      return;
    else if (_cartItems[productId].quantity > 1) {
      _cartItems.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity - 1,
                title: existingCartItem.title,
              ));
    } else
      _cartItems.remove(productId);
  }
}
