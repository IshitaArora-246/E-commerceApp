import 'package:app1/models/catalog.dart';
import 'package:app1/widgets/ratings.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewProduct extends StatelessWidget {
  bool isDataLoaded = false;
  Item item;

  ViewProduct(this.item);

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
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80))),
                child: Center(child: Image.network("${item.image}")),
              ),
              SizedBox(height: 20),
              Text(item.name,
                  style:
                      (TextStyle(fontWeight: FontWeight.bold, fontSize: 28))),
              Center(child: RatingBox()),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(item.desc, style: (TextStyle(fontSize: 14))),
              ),
              SizedBox(height: 10),
              Text("Price: \$${item.price}",
                  style:
                      (TextStyle(fontWeight: FontWeight.bold, fontSize: 28))),
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
                          colors: [Colors.cyan[700], Colors.lightBlue[700]]),
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
