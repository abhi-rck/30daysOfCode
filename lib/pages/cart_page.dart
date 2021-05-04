import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';
import 'package:shop/utils/themes.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: MyThemes.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(padding: EdgeInsets.all(24), child: _CartList()),
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
    var totalPrice = context.select<CartModel, int>(
      // Here, we are only interested whether [item] is inside the cart.
      (cart) => cart.totalPrice,
    );
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '\$${totalPrice}',
            style: TextStyle(
              color: MyThemes.bluishColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 30.0),
          ElevatedButton(
            onPressed: () {
              _scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text("Buy not supported yet."),
              ));
            },
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
    var cart = context.watch<CartModel>();
    return cart.items.length != 0
        ? ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    cart.remove(cart.items[index]);
                  },
                ),
                title: Text(
                  cart.items[index].name,
                ),
              );
            },
          )
        : Center(
            child: Text("Nothing To Show"),
          );
  }
}
