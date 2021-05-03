import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  final Item item;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("Pressed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price}",
          textScaleFactor: 1.5,
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
