import 'package:flutter/material.dart';
import 'package:simple_shopping/models/cartproduct/cartproduct.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/views/auxiliarboxes/common/containerview.dart';
import 'package:simple_shopping/views/auxiliarboxes/cart/countitemsbox.dart';

class CartListContainer extends StatelessWidget {
  final CartProduct cartitem;

  const CartListContainer({super.key, required this.cartitem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productview,
            arguments: cartitem.item);
      },
      child: Container(
        width: 344,
        height: 150,
        margin: const EdgeInsets.only(top: 4, left: 8, right: 8),
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
        child: Containerview(
            item: cartitem.item,
            button: CountItemBox(
              item: cartitem,
            )),
      ),
    );
  }
}
