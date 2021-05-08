import 'package:app1/models/cart.dart';
import 'package:app1/models/catalog.dart';
import 'package:app1/utils/routes.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  CartPage({Key key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Theme.of(context),
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.popAndPushNamed(
                          (context), MyRoutes.homeRoute),
                    )
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: _CartList(),
                  ),
                ),
                Divider(
                  height: 10,
                ),
                Expanded(child: _CartTotal()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({Key key}) : super(key: key);
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$${_cart.totalPrice}", style: TextStyle(fontSize: 28)),
              ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Buying is not supported yet!")));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                    child: Text("Buy"),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  ))
            ],
          ),
        ));
  }
}

class _CartList extends StatefulWidget {
  _CartList({Key key}) : super(key: key);

  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return _cart.items.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/cart.png",
                width: 100,
              ),
              SizedBox(height: 20),
              Text("Oops! your cart is Empty", style: TextStyle(fontSize: 20)),
            ],
          )
        : Container(
            width: MediaQuery.of(context).size.width,
            height: screenHeight,
            constraints: BoxConstraints(
                maxHeight: screenHeight, maxWidth: double.infinity),
            child: ListView.builder(
                itemCount: _cart.items.length,
                itemBuilder: (context, index) {
                  Item item = _cart.items[index] ?? Item();
                  // Item myItem =
                  //     _cart.items[index] != null ? _cart.items[index] : Item();

                  return ListTile(
                    leading: Icon(Icons.done),
                    trailing: IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        print("Remove button pressed!!");
                        _cart.remove(_cart.items[index]);
                        setState(() {});
                      },
                    ),
                    title: Text("${item.name}",
                        style: TextStyle(color: Colors.black)),
                  );
                }));
  }
}
