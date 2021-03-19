import 'package:app1/models/catalog.dart';
import 'package:app1/widgets/drawer.dart';
import 'package:app1/widgets/productWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Mehak";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogjJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogjJson);
    final productsData = decodedData["products"];
    // List<Item> list =
    //     List.from(productsData).map((item) => Item.fromMap(item)).toList();
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: (CatalogModel != null && CatalogModel.items.isNotEmpty)
          ? GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 8, crossAxisSpacing: 8),
              itemBuilder: (context, index) {
                final item = CatalogModel.items[index];
                return Card(
                    elevation: 3,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: GridTile(
                      child: Image.network(item.image),
                      header: Container(
                        child: Text(item.name,
                            style: TextStyle(color: Colors.white)),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.blueGrey),
                      ),
                      footer: Container(
                        child: Text(item.price.toString(),
                            style: TextStyle(color: Colors.white)),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(color: Colors.black87),
                      ),
                    ));
              },
              itemCount: CatalogModel.items.length)
          : Center(child: CircularProgressIndicator()),
      drawer: Mydrawer(),
    );
  }
}
