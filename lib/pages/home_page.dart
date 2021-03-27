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

  Future<int> loadData() async {
    // await Future.delayed(Duration(milliseconds: 1500));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
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
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: FutureBuilder(
          future: loadData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    height: 120,
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(children: [
                      Container(
                        constraints: BoxConstraints(
                            minHeight: 100,
                            minWidth: 100,
                            maxWidth: 100,
                            maxHeight: 100),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: Image.network(
                          item.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text(item.desc,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black)),
                          SizedBox(height: 10),
                          Text('\$800',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500)),
                        ],
                      )
                    ]),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
      drawer: Mydrawer(),
    );
  }
}
