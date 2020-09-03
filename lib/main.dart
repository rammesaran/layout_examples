import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//MyApp is the root of the widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.ac_unit),
            onPressed: () {},
            tooltip: "TAP",
          ),
          title: Text('This is TITLE'),
        ),
        body: ShoppingListCart(
          products: [
            Products(
              name: "Egg",
            ),
            Products(
              name: "podimas",
            ),
            Products(
              name: "EEEE",
            ),
          ],
        ),
      ),
    );
  }
}

class Products {
  final String name;
  Products({this.name});
}

typedef void CartCallBack(Products products, bool cart);

class ShoppinListItem extends StatelessWidget {
  final Products products;
  final bool incart;
  final CartCallBack callBack;

  ShoppinListItem({this.callBack, this.incart, this.products});

  Color getColor(BuildContext context) {
    return incart ? Colors.black : Theme.of(context).primaryColor;
  }

  TextStyle getTextStyle(BuildContext context) {
    if (incart) return null;
    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        callBack(products, incart);
      },
      leading: CircleAvatar(
        backgroundColor: getColor(context),
        child: Text(products.name[0]),
      ),
      title: Text(
        products.name,
        style: getTextStyle(context),
      ),
    );
  }
}

class ShoppingListCart extends StatefulWidget {
  final List<Products> products;
  ShoppingListCart({Key key, this.products}) : super(key: key);
  @override
  _ShoppingListCartState createState() => _ShoppingListCartState();
}

class _ShoppingListCartState extends State<ShoppingListCart> {
  Set<Products> shoppingcart = Set<Products>();

  void handleChange(Products products, bool incart) {
    setState(() {
      if (!incart) {
        shoppingcart.add(products);
      } else {
        shoppingcart.remove(products);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        vertical: 8.0,
      ),
      children: widget.products.map((Products p) {
        return ShoppinListItem(
          products: p,
          incart: shoppingcart.contains(p),
          callBack: handleChange,
        );
      }).toList(),
    );
  }
}
