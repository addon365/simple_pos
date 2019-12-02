import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';
import 'package:simple_pos/models/cart.dart';
import 'package:simple_pos/models/cart_item.dart';

class CartBloc {
  final cart = Cart();
  final _cartItems = PublishSubject<List<CartItem>>();
  final _cartSubject = PublishSubject<Cart>();

  Observable<List<CartItem>> get allCartItems => _cartItems.stream;
  Observable<Cart> get cartStream => _cartSubject.stream;

  void addCartItem(CartItem cartItem) {
    cart.totalAmount = cart.totalAmount + (cartItem.quantity * cartItem.price);
    cart.cartItems.add(cartItem);
    _cartItems.sink.add(cart.cartItems);
    _cartSubject.sink.add(cart);
  }

  dispose() {
    _cartItems.close();
    _cartSubject.close();
  }
}

final cartBloc = CartBloc();
