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
        title: const Text('Product Page'),
      ),
      body: Column(children: [
        const SizedBox(
          height: 4,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: windowsize.width,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                name,
                softWrap: true,
                style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Image.network(
              image,
              width: windowsize.width * 0.6,
            )
          ],
        )
      ]),
    );
  }
}
