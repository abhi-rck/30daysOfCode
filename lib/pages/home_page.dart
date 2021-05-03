import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/models/product.dart';
import 'package:shop/widgets/drawer.dart';
import 'package:shop/widgets/item.dart';

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
    var itemsJson = await rootBundle.loadString("assets/files/items.json");
    var decodeData = jsonDecode(itemsJson);
    var productsData = decodeData["products"];
  }

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
