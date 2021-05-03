import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/widgets/drawer.dart';
import 'package:shop/widgets/item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: ItemModel.items.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: ItemModel.items[index],
          );
        },
      ),
    );
  }
}
