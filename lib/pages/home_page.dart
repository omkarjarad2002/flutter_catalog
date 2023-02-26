import 'dart:ffi';
// import 'dart:html';
// import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';
import 'package:flutter_catalog/widgets/themes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 5));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];

    CatalogModel.items =
        List.from(productsData).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                CatalogList()
              else
                Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return CatalogItem(catalog: catalog);
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        (CatalogImage(
          image: catalog.image,
          name: catalog.name,
          description: catalog.desc,
          price: catalog.price,
        )),
      ]),
    );
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  final String name;
  final String description;
  final int price;
  const CatalogImage(
      {Key? key,
      required this.image,
      required this.name,
      required this.description,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.network(image),
          Expanded(
              child: Column(
            children: [
              Text(name, style: TextStyle(color: MyTheme.darkBluishColor)),
              Text(description, style: TextStyle(color: MyTheme.creamColor)),
              ButtonBar(
                children: [
                  Text(
                    "\$${price}",
                    style: TextStyle(color: Colors.deepPurple),
                  )
                ],
              )
            ],
          ))
        ],
      ),

      // color: MyTheme.creamColor,

      color: Colors.white,
      height: 100,
      width: 300,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catalog App",
          style: TextStyle(fontSize: 40, color: MyTheme.darkBluishColor),
        ),
        Text(
          "Trending Products",
          style: TextStyle(fontSize: 20, color: MyTheme.darkBluishColor),
        ),
      ],
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     // final dumyList = List.generate(20, (index) => CatalogModel.items[0]);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Catalog App"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
//             ? GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: 16,
//                     crossAxisSpacing: 16),
//                 itemBuilder: (context, index) {
//                   final item = CatalogModel.items[index];
//                   return Card(
//                       clipBehavior: Clip.antiAlias,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10)),
//                       child: GridTile(
//                         header: Container(
//                           child: Text(
//                             item.name,
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           padding: EdgeInsets.all(12),
//                           decoration: BoxDecoration(color: Colors.deepPurple),
//                         ),
//                         child: Image.network(item.image),
//                         footer: Container(
//                           child: Text(
//                             item.price.toString(),
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           padding: EdgeInsets.all(12),
//                           decoration: BoxDecoration(color: Colors.black),
//                         ),
//                       ));
//                 },
//                 itemCount: CatalogModel.items.length,
//               )
//             : Center(
//                 child: CircularProgressIndicator(),
//               ),
//       ),
//       drawer: MyDrawer(),
//     );
//   }
// }
