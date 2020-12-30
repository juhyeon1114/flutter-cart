import 'package:flutter/material.dart';
import 'package:flutter_cart/bloc/cart_bloc.dart';
import 'package:flutter_cart/bloc/cart_provider.dart';
import 'package:flutter_cart/cart.dart';
import 'package:flutter_cart/item.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    CartBloc cartBloc = CartProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        actions: [
          IconButton(icon: Icon(Icons.archive), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart()));
          })
        ]
      ),
      body: StreamBuilder<List<Item>>(
        stream: cartBloc.cartList,
        builder: (context, snapshot) => ListView(
          children: cartBloc.itemList.map((item) => _buildItem(item, snapshot.data, cartBloc)).toList()
        )
      )
    );
  }

  Widget _buildItem(Item item, List<Item> state, CartBloc cartBloc) {
    final isChecked = state == null ? false : state.contains(item);

    void toggleCheck() {
      isChecked ? cartBloc.add(CartEvent(CartEventType.remove, item)) : cartBloc.add(CartEvent(CartEventType.add, item));
    }

    return Padding(
      padding: const EdgeInsets.all(4),
      child: ListTile(
        title: Text(item.title, style: TextStyle(fontSize: 24)),
        subtitle: Text('${item.price.toString()}원'),
        trailing: IconButton(
            icon: Icon(Icons.check, color: isChecked ? Colors.green : null),
            onPressed: toggleCheck
        ),
      )
    );
  }
}