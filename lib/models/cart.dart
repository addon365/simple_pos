import 'package:simple_pos/models/cart_item.dart';

class Cart {
  List<CartItem> cartItems;
  double grossAmount;
  int itemCount;
  double discount;
  double totalAmount;
  Cart() {
    cartItems = new List<CartItem>();
    totalAmount=0;
    grossAmount=0;
    itemCount=0;
    discount=0;
    
  }
}
