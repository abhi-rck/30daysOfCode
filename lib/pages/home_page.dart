import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/models/product.dart';
import 'package:shop/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    var itemsJson = await rootBundle.loadString("assets/files/items.json");
    var decodeData = jsonDecode(itemsJson);
    var productsData = decodeData["products"];
    ItemModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
      ),
      drawer: MyDrawer(),
      body: (ItemModel.items != null && ItemModel.items.length != 0)
          ? GridView.builder(
              itemCount: ItemModel.items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 50,
              ),
              itemBuilder: (context, index) {
                final item = ItemModel.items[index];
                return Card(
                  child: GridTile(
                    header: Text(item.name),
                    child: Image.network(item.image),
                  ),
                );
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
