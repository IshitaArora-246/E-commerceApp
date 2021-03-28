import 'package:flutter/material.dart';

class ViewProduct extends StatelessWidget {
  const ViewProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80))),
                child: Center(child: Text("Image here")),
              ),
              SizedBox(height: 20),
              Text("Item name here",
                  style:
                      (TextStyle(fontWeight: FontWeight.bold, fontSize: 28))),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: (TextStyle(fontSize: 14))),
              ),
              SizedBox(height: 50),
              InkWell(
                onTap: () {
                  print("added to cart");
                },
                child: Container(
                  height: 50,
                  width: screenWidth * 0.90,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.pink[200], Colors.lightBlue[900]]),
                      borderRadius: BorderRadius.circular(7)),
                  child: Center(
                    child: Text("Add to Cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 24)),
                  ),
                ),
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: () {
                  print("Payment due");
                },
                child: Container(
                  height: 50,
                  width: screenWidth * 0.90,
                  decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(7)),
                  child: Center(
                    child: Text("Quick buy",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 24)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
