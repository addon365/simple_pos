import 'package:flutter/material.dart';
import 'package:simple_pos/bloc/cart_bloc.dart';
import 'package:simple_pos/dependency/utitlity_methods.dart';
import 'package:simple_pos/models/cart.dart';
import 'package:simple_pos/models/cart_item.dart';

class CartWidget extends StatefulWidget {
  @override
  _CartWidgetState createState() => new _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  getItemImage(CartItem product) {
    if (product.image == null || product.image.isEmpty)
      return Container(
        height: 92,
        width: 92,
      );

    return Image.network(product.image, height: 92, width: 92);
  }

  Widget _buildCartItems() {
    return StreamBuilder(
        stream: cartBloc.allCartItems,
        builder: (context, AsyncSnapshot<List<CartItem>> snapshot) {
          if (snapshot.hasError) return Text(snapshot.error.toString());
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                CartItem cartItem = snapshot.data[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: getItemImage(cartItem),
                  ),
                  title: Text(
                    cartItem.name,
                    style: Theme.of(context).textTheme.body1,
                  ),
                  subtitle: Text("${cartItem.quantity} x ${cartItem.price}"),
                  trailing: Text(toRupees(cartItem.quantity * cartItem.price)),
                );
              },
              separatorBuilder: (BuildContext context, int index) => Divider(
                color: Colors.black,
              ),
            );
          }
          return Center(child: Text("No Items in Cart"));
        });
  }

  Widget _totalRowWidget(Cart cart) {
    if (cart == null) cart = new Cart();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("Total Amount ₹${cart.totalAmount}"),
        Text("Disount ₹${cart.discount}"),
        Expanded(
          child: RaisedButton(
              padding: EdgeInsets.fromLTRB(45.0, 25.0, 45.0, 25.0),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
              child: Text(
                "Collect ${toRupees(cart.totalAmount - cart.discount)}",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        children: <Widget>[
          Expanded(
            child: _buildCartItems(),
          ),
          Container(
            color: Colors.grey.shade300,
            height: 180,
            child: StreamBuilder<Cart>(
              stream: cartBloc.cartStream,
              builder: (context, AsyncSnapshot<Cart> snapshot) {
                if (snapshot.hasData) return _totalRowWidget(snapshot.data);
                return _totalRowWidget(null);
              },
            ),
          )
        ],
      ),
    );
  }
}
