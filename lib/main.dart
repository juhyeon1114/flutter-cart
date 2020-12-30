import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart/bloc/cart_bloc.dart';
import 'package:flutter_cart/catalog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /**
     * BlocProvider == Bloc을 주입
     * BlocBuilder == 주입받은 Bloc을 사용
     */
    return BlocProvider(
        create: (_) => CartBloc(),
        child: BlocBuilder<CartBloc, List>(
          builder: (_, state) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: LoginScreen(),
          )
        )
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

