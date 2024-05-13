import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/cartproduct/cartproduct.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/settings/app_text.dart';
import 'package:simple_shopping/settings/colors.dart';
import 'package:simple_shopping/screens/auxiliarboxes/common/acctionsbutton.dart';
import 'package:simple_shopping/screens/auxiliarboxes/common/apphomebar.dart';
import 'package:simple_shopping/screens/auxiliarboxes/product/menucantidades.dart';
import 'package:simple_shopping/screens/auxiliarboxes/common/ratingsstars.dart';

class ProductView extends StatelessWidget {
  final Product item;

  ProductView({Key? key, required this.item}) : super(key: key);

  final labelStyle = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black);

  final imageBoxStyle = BoxDecoration(
      border:
          Border.all(width: 2, color: Colors.black, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(8.0));

  final textStockStyle = const TextStyle(
      color: AppColors.brandOnSuccesColor,
      fontWeight: FontWeight.w300,
      fontSize: 24);

  final foregroundDecorationQuantiteButton = BoxDecoration(
      border:
          Border.all(width: 2, color: Colors.black, style: BorderStyle.solid),
      borderRadius: BorderRadius.circular(8.0));

  @override
  Widget build(BuildContext context) {
    final Size windowsize = MediaQuery.of(context).size;
    final int cantidad = context.watch<ApiController>().cartQuantitie;
    return Scaffold(
      appBar: const AppHomeBar(
        searchWidth: 235,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              //Titulo Item
              Container(
                width: windowsize.width,
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
                foregroundDecoration: imageBoxStyle,
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
                margin: const EdgeInsets.only(top: 8),
                child: Text(
                  item.description,
                  softWrap: true,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ),
              //Stockage
              Container(
                alignment: AlignmentDirectional.centerStart,
                margin: const EdgeInsets.only(top: 16),
                child: Text(AppText.stock,
                    textAlign: TextAlign.start, style: textStockStyle),
              ),
              //Desplegable de cantidad
              Container(
                  width: 240,
                  margin: const EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                      color: AppColors.brandLightGreyColor,
                      borderRadius: BorderRadius.circular(8)),
                  foregroundDecoration: foregroundDecorationQuantiteButton,
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
                        .addToCart(CartProduct(item: item, cantidad: cantidad));
                  },
                  background: AppColors.brandAddButtonColor,
                  labelStyle: labelStyle),
              //Boton Comprar ya
              ActionButton(
                  label: AppText.buynow,
                  width: 240,
                  margin: const EdgeInsets.only(top: 8),
                  tag: 'Buy',
                  function: () {
                    debugPrint('Comprar ya');
                  },
                  background: AppColors.brandBuyButtonColor,
                  labelStyle: labelStyle),
            ],
          ),
        ),
      ),
    );
  }
}
