import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import '../widgets/product_edit_item.dart';
import '../screens/edit_product_screen.dart';

class ManageProductsScreen extends StatelessWidget {
  static const String routeName = '/manage-product';
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;
    return Scaffold(
        appBar: AppBar(
          title: Text('Manage Products'),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushNamed(EditProductScreen.routeName);
                })
          ],
        ),
        body: ListView.builder(
          itemBuilder: (ctx, index) => Column(
            children: [
              ProductEditItem(products[index].imageUrl, products[index].title),
              Divider(
                thickness: 2,
              ),
            ],
          ),
          itemCount: products.length,
        ));
  }
}
