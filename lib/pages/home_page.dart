import 'package:flutter/material.dart';
import 'package:simple_pos/widget/cart_widget.dart';

import 'package:simple_pos/widget/product_list_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            Text("Sales"),
            Row(
              children: <Widget>[
                Container(width: 120, child: TextField()),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: CartWidget()),
          Expanded(child: ProductListWidget()),
        ],
      ),
    );
  }
}
