import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/themes.dart';

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
                alignment: MainAxisAlignment.spaceBetween,
                // buttonPadding: EdgeInsets.zero,
                children: [
                  Text(
                    "\$${price}",
                    style: TextStyle(color: Colors.deepPurple),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Buy"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                  )
                ],
              )
            ],
          ))
        ],
      ),

      // color: MyTheme.creamColor,

      color: Colors.white,
      height: 120,
      width: 300,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.all(10.0),
    );
  }
}
