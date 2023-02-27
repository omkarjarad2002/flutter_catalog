import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';

import '../../models/catalog.dart';
import '../home_page.dart';
import 'catalog_image.dart';

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
