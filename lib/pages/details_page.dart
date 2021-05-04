import 'package:flutter/material.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/themes.dart';
import 'package:shop/widgets/addtocart.dart';

class DetailsPage extends StatelessWidget {
  final Item item;
  const DetailsPage({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Hero(
              tag: Key(item.id.toString()),
              child: Container(
                padding: EdgeInsets.only(top: 12),
                child: Image.network(item.image),
                height: 300,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 42),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  )),
              child: Column(
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      fontSize: 28.0,
                      color: MyThemes.bluishColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    item.desc,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${item.price}",
                textScaleFactor: 1.6,
                style: TextStyle(
                  color: Colors.red[800],
                  fontWeight: FontWeight.bold,
                ),
              ),
              AddToCart(item: item),
            ],
          ),
        ),
      ),
    );
  }
}
