import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/views/auxiliarboxes/apphomebar.dart';
import 'package:simple_shopping/views/auxiliarboxes/product_list_container.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    late UnmodifiableListView<Product> list =
        context.watch<ApiController>().cart;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue[200],
          iconTheme: const IconThemeData(color: Colors.black),
          title: const AppHomeBar()),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: ProductListContainer(list[index]));
                  }))
        ],
      ),
    );
  }
}
