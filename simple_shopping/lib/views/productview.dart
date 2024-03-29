import 'package:flutter/material.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/settings/app_text.dart';
import 'package:simple_shopping/views/auxiliarboxes/acctionsbutton.dart';
import 'package:simple_shopping/views/auxiliarboxes/apphomebar.dart';
import 'package:simple_shopping/views/auxiliarboxes/menucantidades.dart';
import 'package:simple_shopping/views/auxiliarboxes/ratingsstars.dart';

class ProductView extends StatelessWidget {
  final Product item;

  const ProductView({
    Key? key,
    required this.item
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size windowsize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const AppHomeBar(actualroute: AppRoutes.productview,),
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
                item.description ?? AppText.nodescriptionerror,
                softWrap: true,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Text(AppText.stock,
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
                        width: 2,
                        color: Colors.black,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Desplegable()),
            ActionButton(
              label: AppText.addtocart,
              width: 240,
              margin: const EdgeInsets.only(top: 24),
              tag: 'Add',
              function: () {
                debugPrint('Añadido al carrito');
              },
              fontSize: 18,
              background: Colors.amber[400],
            ),
            ActionButton(
              label: AppText.buynow,
              width: 240,
              margin: const EdgeInsets.only(top: 8),
              tag: 'Buy',
              function: () {
                debugPrint('Comprar ya');
              },
              fontSize: 18,
              background: const Color.fromARGB(255, 255, 169, 40),
            ),
          ],
        ),
      ),
    );
  }
}
