import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart/cart.dart';
import 'home/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<Cart>(
      // builder: (_) => Cart(),
      dispose: (_, cart) => cart.dispose(),
      create: (_) => Cart(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
