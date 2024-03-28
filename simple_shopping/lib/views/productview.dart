import 'package:flutter/material.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/views/auxiliarboxes/apphomebar.dart';
import 'package:simple_shopping/views/auxiliarboxes/search_container.dart';
class ProductView extends StatelessWidget {
  final Product item;

  const ProductView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size windowsize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const AppHomeBar(),
        backgroundColor: Colors.blue[200],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8,
            ),
            Container(
              width: windowsize.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                item.title,
                softWrap: true,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network(
              item.image,
              width: windowsize.width * 0.6,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: windowsize.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '${item.price.toString()} €',
                softWrap: true,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Container(
              width: windowsize.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                item.description ?? 'No description',
                softWrap: true,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            FloatingActionButton.extended(
              onPressed: () {
                debugPrint('Añadido al carrito');
              },
              label: const Text('Añadir al carrito',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              backgroundColor: Colors.amber[400],
            )
          ],
        ),
      ),
    );
  }
}
