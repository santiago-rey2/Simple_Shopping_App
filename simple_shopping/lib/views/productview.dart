import 'package:flutter/material.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/views/auxiliarboxes/apphomebar.dart';
import 'package:simple_shopping/views/auxiliarboxes/menucantidades.dart';
import 'package:simple_shopping/views/auxiliarboxes/ratingsstars.dart';

class ProductView extends StatelessWidget {
  final Product item;

  const ProductView({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size windowsize = MediaQuery.of(context).size;
    int dropmenuvalue = 1;
    return Scaffold(
      appBar: AppBar(
        title: const AppHomeBar(),
        backgroundColor: Colors.blue[200],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: windowsize.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                item.title,
                softWrap: true,
                style: const TextStyle(
                    fontSize: 24, fontWeight: FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              foregroundDecoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Colors.black, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(8.0)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.image,
                  width: 180,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.only(top: 16),
                height: 24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Ratings(item: item),
                    Text(
                      '${item.price.toString()} €',
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.normal),
                    ),
                  ],
                )),
            Container(
              width: windowsize.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                item.description ?? 'No description',
                softWrap: true,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text('En Stock',
                  style: TextStyle(
                      color: Colors.green[300],
                      fontWeight: FontWeight.w300,
                      fontSize: 24)),
            ),
            Container(
              width: 240,
              margin: const EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8)),
              foregroundDecoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Colors.black, style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(8.0)),
              child: const Desplegable()
            ),
            Container(
              margin: const EdgeInsets.only(top: 24),
              width: 240,
              child: FloatingActionButton.extended(
                heroTag: const Text('Añadir'),
                onPressed: () {
                  debugPrint('Añadido al carrito');
                },
                label: const Text('Añadir al carrito',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                backgroundColor: Colors.amber[400],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              width: 240,
              child: FloatingActionButton.extended(
                heroTag: const Text('Comprar'),
                onPressed: () {
                  debugPrint('Comprar ya');
                },
                label: const Text('Comprar ya',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
                backgroundColor: const Color.fromARGB(255, 255, 169, 40),
              ),
            )
          ],
        ),
      ),
    );
  }
}
