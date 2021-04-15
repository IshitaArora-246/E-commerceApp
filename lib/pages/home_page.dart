import 'package:app1/models/cart.dart';
import 'package:app1/models/catalog.dart';
import 'package:app1/pages/carts_page.dart';
import 'package:app1/pages/productView.dart';
import 'package:app1/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:badges/badges.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cart = CartModel();
  bool isDataLoaded = false;
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<int> loadData() async {
    // final catalogJson =
    //     await rootBundle.loadString("assets/files/catalog.json");

    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    isDataLoaded = true;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                      builder: (context) => IconButton(
                          icon: Icon(Icons.menu, color: Colors.lightBlue[900]),
                          onPressed: () => Scaffold.of(context).openDrawer())),
                  Text("Catalog App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.lightBlue[900],
                          letterSpacing: 2,
                          fontSize: 30)),
                  Badge(
                    badgeColor: Colors.lightBlue[900],
                    borderRadius: BorderRadius.circular(8),
                    badgeContent: Text("${_cart.items.length}",
                        style: TextStyle(color: Colors.white)),
                    position: BadgePosition.topEnd(end: -5, top: -5),
                    child: IconButton(
                        icon: Image.asset("assets/images/cart-icon.png",
                            color: Colors.black),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartPage()))),
                  )
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: loadData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: CatalogModel.items.length,
                        itemBuilder: (context, index) {
                          final Item item = CatalogModel.items[index];

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewProduct(item)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 8),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                height: 135,
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(children: [
                                  Container(
                                    constraints: BoxConstraints(
                                        minHeight: 110,
                                        minWidth: 110,
                                        maxWidth: 110,
                                        maxHeight: 110),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Image.network(
                                      item.image,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Expanded(
                                    child: Container(
                                      color: Colors.blue,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10),
                                          Text(
                                            item.name,
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                            // width: MediaQuery.of(context)
                                            //         .size
                                            //         .width *
                                            //     0.,
                                            child: Text(item.desc,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black)),
                                          ),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('\$${item.price}',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  }),
            ),
          ],
        ),
      ),
      drawer: Mydrawer(),
    );
  }
}
