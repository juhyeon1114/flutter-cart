import 'package:flutter/widgets.dart';
import 'package:flutter_cart/bloc/cart_bloc.dart';

class CartProvider extends InheritedWidget  {
  final CartBloc cartBloc;

  // cartBloc은 외부에서 인자로 받은 게 있으면 그것을 넣어주고 없으면 생성해서 넣어주기. 의도적으로 외부에서 CartBloc을 안받으려고 그럼
  // key, child는 InheritedWidget의 생성자를 호출해서 실행
  CartProvider({Key key, CartBloc cartBloc, Widget child})
      : cartBloc = cartBloc ?? CartBloc(), super(key: key, child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    throw UnimplementedError();
  }

  // context의 타입이 CartProvider면 context.cartBloc을 리턴
  static CartBloc of(BuildContext context) => (context as CartProvider).cartBloc;

}