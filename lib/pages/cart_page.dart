import 'package:flutter/material.dart';
import 'package:shop/utils/themes.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyThemes.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(padding: EdgeInsets.all(32), child: _CartList()),
          ),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "\$9999",
            textScaleFactor: 1.6,
            style: TextStyle(
              color: MyThemes.bluishColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 30.0),
          ElevatedButton(
            onPressed: () {},
            child: Text("Buy Now"),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyThemes.bluishColor)),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.done),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {},
            ),
            title: Text(
              "Item1",
            ),
          );
        });
  }
}
