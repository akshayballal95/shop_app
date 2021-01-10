import 'package:flutter/material.dart';

import '../providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final ord.OrderItem order;

  OrderItem(this.order);
  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order.value}',
                style: TextStyle(
                  fontSize: 18,
                )),
            subtitle: Text(
                DateFormat('dd/MM/yy hh:mm').format(widget.order.dateTime)),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 5,
              ),
              height: 200,
              child: ListView(
                children: widget.order.products
                    .map((cartItem) => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              cartItem.title,
                              style: TextStyle(fontSize: 16),
                            ),
                            Text('${cartItem.quantity}x',
                                style: TextStyle(fontSize: 16))
                          ],
                        ))
                    .toList(),
              ),
            )
        ],
      ),
    );
  }
}
