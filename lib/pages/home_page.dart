import 'package:app1/models/catalog.dart';
import 'package:app1/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDataLoaded = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // await Future.delayed(Duration(milliseconds: 1500));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    final productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    isDataLoaded = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: (isDataLoaded)
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
