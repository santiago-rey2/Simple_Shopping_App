import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/cartproduct/cartproduct.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/settings/app_text.dart';
import 'package:simple_shopping/views/auxiliarboxes/common/acctionsbutton.dart';
import 'package:simple_shopping/views/auxiliarboxes/common/apphomebar.dart';
import 'package:simple_shopping/views/auxiliarboxes/cart/cart_list_container.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    UnmodifiableListView<CartProduct> list =
        context.watch<ApiController>().cart;
    double cartprice = context.watch<ApiController>().totalprice;
    return Scaffold(
      appBar: const AppHomeBar(actualroute: AppRoutes.cartview),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: CartListContainer(cartitem: list[index]));
                  })),
          Container(
              margin: const EdgeInsets.only(top: 4),
              child: Text(
                'Total Price : $cartprice €',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              )),
          ActionButton(
            label: AppText.buynow,
            width: 344,
            margin: const EdgeInsets.only(top: 4, bottom: 16),
            background: Colors.amber[400],
            function: () {
              debugPrint('Comprado');
            },
            labelStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
          )
        ],
      ),
    );
  }
}
