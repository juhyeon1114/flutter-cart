import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cart/bloc/cart_bloc.dart';
import 'package:flutter_cart/cart.dart';
import 'package:flutter_cart/item.dart';

class Catalog extends StatefulWidget {
  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<Item> _itemList = itemList;

  @override
  Widget build(BuildContext context) {
    /**
     * 상위 Widget에서 주입받은 Bloc에 접근하려면 이렇게 정의하고 접근하면 된다.
     */
    final _cartBloc = BlocProvider.of<CartBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        actions: [
          IconButton(icon: Icon(Icons.archive), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => Cart()));
          })
        ]
      ),
      body: BlocBuilder<CartBloc, List>(
        builder: (_, state) => ListView(
          children: _itemList.map((item) => _buildItem(item, state, _cartBloc)).toList(),
        )
      )

    );
  }

  Widget _buildItem(Item item, List state, CartBloc cartBloc) {
    final isChecked = state.contains(item);

    void toggleCheck() {
      setState(() {
        isChecked ? cartBloc.add(CartEvent(CartEventType.remove, item)) : cartBloc.add(CartEvent(CartEventType.add, item));
      });
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