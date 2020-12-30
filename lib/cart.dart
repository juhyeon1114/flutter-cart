import 'package:flutter/material.dart';
import 'package:flutter_cart/bloc/cart_bloc.dart';
import 'package:flutter_cart/bloc/cart_provider.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = CartProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('cart')),
      body: StreamBuilder(
        stream: cartBloc.cartList,
        builder: (context, snapshot) {
          int sum = 0;
          if (snapshot.data.length > 0) {
            sum = snapshot.data.map((item) => item.price).reduce((prev, e) => prev + e);
          }
          return Center(
            child: Text('합계 : $sum'),
          );
        },
      )
    );
  }
}
