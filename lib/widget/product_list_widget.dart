

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:simple_pos/bloc/cart_bloc.dart';
import 'package:simple_pos/bloc/product_bloc.dart';
import 'package:simple_pos/models/cart_item.dart';
import 'package:simple_pos/models/catelog_item.dart';

class ProductListWidget extends StatefulWidget {
  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  Widget _filterButtons() {
    return StreamBuilder<int>(
        stream: productBloc.filteredIndex,
        initialData: 0,
        builder: (context, snapshot) {
          return ButtonBar(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  productBloc.updateFilterIndex(0);
                },
                child: Text(
                  "All",
                  style: TextStyle(
                      fontSize: 20,
                      color: snapshot.data == 0
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).accentColor),
                ),
              ),
              FlatButton(
                onPressed: () {
                  productBloc.updateFilterIndex(1);
                },
                child: Text(
                  "Meidum",
                  style: TextStyle(
                      fontSize: 20,
                      color: snapshot.data == 1
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).accentColor),
                ),
              ),
              FlatButton(
                onPressed: () {
                  productBloc.updateFilterIndex(2);
                },
                child: Text(
                  "Large",
                  style: TextStyle(
                      fontSize: 20,
                      color: snapshot.data == 2
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).accentColor),
                ),
              )
            ],
          );
        });
  }

  Widget _aProductWidget(CatelogItem product) {
    return InkWell(
      onTap: () {
        cartBloc.addCartItem(CartItem(
            name: product.name,
            image: product.image,
            price: product.price,
            quantity: 3));
      },
      child: Card(
          child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Text(
                "₹${product.price}",
                style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Center(child: getItemImage(product)),
          Align(
            alignment: Alignment.topRight,
            child: Icon(Icons.add_shopping_cart),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(product.name,
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600)),
              )),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              "assets/images/turn_paper.png",
              scale: 12,
            ),
          )
        ],
      )),
    );
  }

  Widget _buildProductGridView() {
    return StreamBuilder<UnmodifiableListView<CatelogItem>>(
      stream: productBloc.allProducts,
      initialData: UnmodifiableListView([]),
      builder: (BuildContext context,
          AsyncSnapshot<UnmodifiableListView<CatelogItem>> snapshot) {
        return GridView.count(
          crossAxisSpacing: 15.0,
          crossAxisCount: 3,
          children:
              snapshot.data.map<Widget>((f) => _aProductWidget(f)).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _filterButtons(),
        Expanded(child: _buildProductGridView()),
      ],
    );
  }

  getItemImage(CatelogItem product) {
    if (product.image == null || product.image.isEmpty)
      return Container(
        height: 92,
        width: 92,
      );

    return Image.network(product.image, height: 92, width: 92);
  }
}
