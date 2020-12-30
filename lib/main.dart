import 'package:flutter/material.dart';
import 'package:flutter_cart/bloc/cart_provider.dart';
import 'package:flutter_cart/catalog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(child: RaisedButton(
        child: Text('Enter'),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Catalog()));
        }),
      )
    );
  }
}

