import 'package:flutter/material.dart';
import '../screens/orders_screen.dart';
import '../screens/manage_products_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        AppBar(
          title: Text('Hello Friend'),
          automaticallyImplyLeading: true,
        ),
        ListTile(
          leading: Icon(Icons.shop),
          title: Text('Shop', style: TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.payment),
          title: Text('Orders', style: TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrdersScreen.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.edit),
          title: Text('Manage Products', style: TextStyle(fontSize: 18)),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(ManageProductsScreen.routeName);
          },
        ),
        Divider(),
      ],
    ));
  }
}
