import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/cartproduct/cartproduct.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/screens/auxiliarboxes/common/containerview.dart';
import 'package:simple_shopping/screens/auxiliarboxes/cart/countitemsbox.dart';

class CartListContainer extends StatelessWidget {
  final CartProduct cartitem;

  CartListContainer({super.key, required this.cartitem});

  final tileDecoration = BoxDecoration(
      color: Colors.grey[300], borderRadius: BorderRadius.circular(8));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ApiController>().setQuantitie(1);
        Navigator.pushNamed(context, AppRoutes.productview,
            arguments: cartitem.item);
      },
      child: Container(
        width: 344,
        height: 150,
        margin: const EdgeInsets.only(top: 4, left: 8, right: 8),
        decoration: tileDecoration,
        child: Containerview(
            item: cartitem.item,
            button: CountItemBox(
              item: cartitem,
            )),
      ),
    );
  }
}
