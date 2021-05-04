import 'package:flutter/material.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';
import 'package:provider/provider.dart';
import 'package:shop/utils/themes.dart';
import 'package:shop/pages/details_page.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
      // Here, we are only interested whether [item] is inside the cart.
      (cart) => cart.items.contains(item),
    );
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          // If the item is not in cart, we let the user add it.
          // We are using context.read() here because the callback
          // is executed whenever the user taps the button. In other
          // words, it is executed outside the build method.
          var cart = context.read<CartModel>();
          cart.add(item);
        }
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailsPage(item: item)));
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyThemes.bluishColor),
          elevation: MaterialStateProperty.all(0.0),
          shape: MaterialStateProperty.all(StadiumBorder())),
      child: isInCart
          ? Icon(Icons.done)
          : Text(
              "Add to Cart",
              textScaleFactor: 0.8,
            ),
    );
  }
}
