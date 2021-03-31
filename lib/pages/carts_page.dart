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
    return Scaffold(
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
              Padding(
                padding: const EdgeInsets.all(32),
                child: Expanded(child: Placeholder()),
              ),
              Divider(),
              CartTotal(),
              // SizedBox(height: 200),
              // Center(
              //   child: Image.asset(
              //     "assets/images/cart.png",
              //     width: 200,
              //     color: Colors.black,
              //   ),
              // ),
              // SizedBox(height: 20),
              // Text("Your cart is empty!", style: TextStyle(fontSize: 30))
            ],
          ),
        ),
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$240", style: TextStyle(fontSize: 28)),
            ElevatedButton(
                onPressed: () {
                  AlertDialog(title: Text("Alert"));
                },
                child: Text("Buy"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                ))
          ],
        ));
  }
}
