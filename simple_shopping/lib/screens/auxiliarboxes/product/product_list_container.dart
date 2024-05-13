import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/cartproduct/cartproduct.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/settings/app_text.dart';
import 'package:simple_shopping/screens/auxiliarboxes/common/acctionsbutton.dart';
import 'package:simple_shopping/screens/auxiliarboxes/common/containerview.dart';

class ProductListContainer extends StatelessWidget {
  final Product item;

  const ProductListContainer(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    //final Size windowsize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        context.read<ApiController>().setQuantitie(1);
        Navigator.pushNamed(context, AppRoutes.productview, arguments: item);
      },
      child: Container(
          width: 344,
          height: 150,
          margin: const EdgeInsets.only(top: 4, left: 8, right: 8),
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
          child: Containerview(
            item: item,
            button: ActionButton(
                label: AppText.addtocart,
                width: 130,
                height: 35,
                margin: const EdgeInsets.only(left: 30),
                function: () {
                  debugPrint('Añadido al carrito');
                  context
                      .read<ApiController>()
                      .addToCart(CartProduct(item: item, cantidad: 1));
                },
                background: Colors.amber[400],
                labelStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
                tag: item.title),
          )),
    );
  }
}
