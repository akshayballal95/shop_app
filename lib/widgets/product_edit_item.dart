import 'package:flutter/material.dart';
import '../screens/edit_product_screen.dart';

class ProductEditItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  const ProductEditItem(this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      title: Text(title),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).errorColor,
              ),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
