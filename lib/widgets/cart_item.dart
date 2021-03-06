import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String title;
  final double price;
  final int quantity;
  final String id;
  final String productId;

  CartItem(this.title, this.price, this.quantity, this.id, this.productId);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Are you sure'),
                  content: Text('Do you want to delete this item'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: Text('No')),
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                        },
                        child: Text('Yes')),
                  ],
                ));
      },
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cart.removeProduct(productId);
      },
      background: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          padding: EdgeInsets.all(10),
          alignment: Alignment.centerRight,
          color: Theme.of(context).errorColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          )),
      child: Card(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: FittedBox(
                child: Text(
                  '\$${price.toString()}',
                ),
              ),
            ),
          ),
          title: Text(title),
          subtitle: Text('Total: \$${(price * quantity).toString()}'),
          trailing: Text('${quantity}x'),
        ),
      ),
    );
  }
}
