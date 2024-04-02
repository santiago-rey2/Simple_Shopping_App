import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/cartproduct/cartproduct.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/settings/app_text.dart';
import 'package:simple_shopping/settings/colors.dart';
import 'package:simple_shopping/views/auxiliarboxes/common/acctionsbutton.dart';
import 'package:simple_shopping/views/auxiliarboxes/common/apphomebar.dart';
import 'package:simple_shopping/views/auxiliarboxes/product/menucantidades.dart';
import 'package:simple_shopping/views/auxiliarboxes/common/ratingsstars.dart';

class ProductView extends StatelessWidget {
  final Product item;

  const ProductView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size windowsize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppHomeBar(actualroute: AppRoutes.productview),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //Titulo Item
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
            //Box Imagen
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
            //Box Rating y Precio
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
            //Descripción de Producto
            Container(
              width: windowsize.width,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.only(top: 8),
              child: Text(
                item.description ?? AppText.nodescriptionerror,
                softWrap: true,
                textAlign: TextAlign.start,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              ),
            ),
            //Stocaje
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              alignment: AlignmentDirectional.centerStart,
              margin: const EdgeInsets.only(top: 16),
              child: const Text(AppText.stock,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: AppColors.brandOnSuccesColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 24)),
            ),
            //Desplegable de cantidad
            Container(
                width: 240,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                    color: AppColors.brandLightColor,
                    borderRadius: BorderRadius.circular(8)),
                foregroundDecoration: BoxDecoration(
                    border: Border.all(
                        width: 2,
                        color: Colors.black,
                        style: BorderStyle.solid),
                    borderRadius: BorderRadius.circular(8.0)),
                child: const Desplegable()),
            //Boton añadir al carrito
            ActionButton(
              label: AppText.addtocart,
              width: 240,
              margin: const EdgeInsets.only(top: 24),
              tag: 'Add',
              function: () {
                context
                    .read<ApiController>()
                    .addToCart(CartProduct(item: item, cantidad: 1));
              },
              fontSize: 18,
              background: AppColors.brandAddButtonColor,
            ),
            //Boton Comprar ya
            ActionButton(
              label: AppText.buynow,
              width: 240,
              margin: const EdgeInsets.only(top: 8),
              tag: 'Buy',
              function: () {
                debugPrint('Comprar ya');
              },
              fontSize: 18,
              background: AppColors.brandBuyButtonColor,
            ),
          ],
        ),
      ),
    );
  }
}
