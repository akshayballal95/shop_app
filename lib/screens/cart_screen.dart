import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';

import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Cart'),
        ),
        body: Column(
          children: [
            Card(
              margin: EdgeInsets.all(15),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Chip(
                      label: Text(
                        '\$${cart.cartValue.toStringAsFixed(2)}',
                        style: TextStyle(
                            color: Theme.of(context)
                                .primaryTextTheme
                                .headline6
                                .color),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    FlatButton(
                        onPressed: () {
                          print('Button Pressed');
                          Provider.of<Order>(context, listen: false).addOrder(
                            cart.cartItems.values.toList(),
                            cart.cartValue,
                          );
                          cart.clearCart();
                        },
                        child: Text('Order Now',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor))),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.cartItems.length,
                itemBuilder: (ctx, index) => CartItem(
                  cart.cartItems.values.toList()[index].title,
                  cart.cartItems.values.toList()[index].price,
                  cart.cartItems.values.toList()[index].quantity,
                  cart.cartItems.values.toList()[index].id,
                  cart.cartItems.keys.toList()[index],
                ),
              ),
            ),
          ],
        ));
  }
}
