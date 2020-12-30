import 'package:flutter_cart/item.dart';
import 'package:rxdart/rxdart.dart';

enum CartEventType { add, remove }

class CartEvent {
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}

class CartBloc {
  final itemList = [
    Item('맥북', 2000000),
    Item('삼성', 1000000),
    Item('엘지', 900000),
    Item('레노버', 500000),
    Item('기가바이트', 700000),
  ];

  final _cartList = List<Item>();
  final _cartListSubject = BehaviorSubject<List<Item>>.seeded([]);
  Stream<List<Item>> get cartList => _cartListSubject.stream;

  void add(CartEvent event) {
    switch (event.type) {
      case CartEventType.remove:
        _cartList.remove(event.item);
        break;
      case CartEventType.add:
        _cartList.add(event.item);
        break;
    }
    _cartListSubject.add(_cartList);
  }
}

