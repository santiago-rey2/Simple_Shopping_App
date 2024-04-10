import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/views/auxiliarboxes/common/apphomebar.dart';
import 'package:simple_shopping/views/auxiliarboxes/product/product_list_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    //Carga de datos de la tienda
    Provider.of<ApiController>(context, listen: false).getAllProsducts();
  }

  final List<BottomNavigationBarItem> pageList = [];

  @override
  Widget build(BuildContext context) {
    UnmodifiableListView<Product> list =
        context.watch<ApiController>().products;
    return Scaffold(
      appBar: const AppHomeBar(
        actualroute: AppRoutes.productlist,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 4,
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
