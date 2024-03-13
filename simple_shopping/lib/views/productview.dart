import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';

class Product_View extends StatelessWidget {
  String image;
  String name;

  Product_View({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size windowsize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Prduct Page'),
      ),
      body: Column(children: [
        const SizedBox(
          height: 4,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              image,
              width: 200,
              height: 200,
            ),
            Container(
              width: windowsize.width - 204,
              child: Text(
                name,
                softWrap: true,
                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
            )
          ],
        )
      ]),
    );
  }
}
