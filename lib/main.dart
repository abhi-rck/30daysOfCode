import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/product.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/details_page.dart';
import 'package:shop/pages/home_page.dart';
import 'package:shop/pages/login_page.dart';
import 'package:shop/utils/routes.dart';
import 'package:shop/utils/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // In this sample app, ItemModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => ItemModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on ItemModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<ItemModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        themeMode: ThemeMode.system,
        theme: MyThemes.lightTheme(context),
        darkTheme: MyThemes.darkTheme(context),
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoutes.homeRoute,
        routes: {
          MyRoutes.homeRoute: (context) => HomePage(),
          MyRoutes.loginRoute: (context) => LoginPage(),
          MyRoutes.detailsRoute: (context) => DetailsPage(),
          MyRoutes.cartRoute: (context) => CartPage()
        },
      ),
    );
  }
}
