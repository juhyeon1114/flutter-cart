import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart/bloc/cart_bloc.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    final _cartBloc = BlocProvider.of<CartBloc>(context);

    int _sum = _cartBloc.state.map((item) => item.price).reduce((prev, e) => prev + e);

    return Scaffold(
      appBar: AppBar(title: Text('cart')),
      body: Center(child: Text('합계 : $_sum'),)
    );
  }
}
