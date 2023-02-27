import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';

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
