import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/screens/auxiliarboxes/common/apphomebar.dart';
import 'package:simple_shopping/screens/auxiliarboxes/home/categoryfilter.dart';
import 'package:simple_shopping/screens/auxiliarboxes/product/product_list_container.dart';
import 'package:simple_shopping/settings/colors.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    super.initState();
    //Carga de datos de la tienda
    Provider.of<ApiController>(context, listen: false).getAllProducts();
    Provider.of<ApiController>(context, listen: false).getAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    UnmodifiableListView<Product> list =
        context.watch<ApiController>().products;
    List<String> categories = context.watch<ApiController>().category;

    return Scaffold(
      appBar: const AppHomeBar(),
      body: Column(
        children: [
          SizedBox(
            height: 45,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint(categories.toString());
                  },
                  child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      width: 150,
                      child: CategoryFilter(categories: categories,)),
                ),
                Container(
                  width: 1,
                  decoration: const BoxDecoration(
                      color: AppColors.brandDivisorLineColor),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: const Text('Dirección'))
              ],
            ),
          ),
          Container(
            height: 1,
            decoration:
                const BoxDecoration(color: AppColors.brandDivisorLineColor),
          ),
          // Lista de productos de la tienda
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ProductListContainer(list[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
