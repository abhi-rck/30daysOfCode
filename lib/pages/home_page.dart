import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shop/models/product.dart';
import 'package:shop/pages/details_page.dart';
import 'package:shop/utils/routes.dart';
import 'package:shop/utils/themes.dart';
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
    await Future.delayed(Duration(seconds: 1));
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
      backgroundColor: MyThemes.creamColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyThemes.bluishColor,
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeader(),
              SizedBox(height: 10.0),
              (ItemModel.items != null && ItemModel.items.length != 0)
                  ? Expanded(child: ItemList())
                  : Center(child: CircularProgressIndicator()),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 2.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MyShop",
            textScaleFactor: 1.3,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: MyThemes.bluishColor,
            ),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            "Trending Products",
            textScaleFactor: 1,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w200,
              color: MyThemes.bluishColor,
            ),
          ),
        ],
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ItemModel.items.length,
      itemBuilder: (context, index) {
        Item item = ItemModel.getByPosition(index);
        return ListItem(item: item);
      },
    );
  }
}

class ListItem extends StatelessWidget {
  final Item item;
  const ListItem({Key key, @required Item this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Container(
        height: 150.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: Hero(
                tag: Key(item.id.toString()),
                child: Container(
                  decoration: BoxDecoration(
                    color: MyThemes.creamColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.network(item.image),
                  width: 120,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: MyThemes.bluishColor,
                    ),
                  ),
                  Text(
                    item.desc,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      buttonPadding: EdgeInsets.zero,
                      children: [
                        Text(
                          "\S${item.price}",
                          textScaleFactor: 1.3,
                          style: TextStyle(
                            color: MyThemes.bluishColor,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsPage(item: item)));
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  MyThemes.bluishColor),
                              elevation: MaterialStateProperty.all(0.0),
                              shape:
                                  MaterialStateProperty.all(StadiumBorder())),
                          child: Text(
                            "Add to Cart",
                            textScaleFactor: 0.8,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
