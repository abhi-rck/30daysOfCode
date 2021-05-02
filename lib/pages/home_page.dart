import 'package:flutter/material.dart';
import 'package:shop/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Text("HomePage"),
      ),
    );
  }
}
