import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/views/auxiliarboxes/apphomebar.dart';
import 'package:simple_shopping/views/auxiliarboxes/panel_lateral.dart';
import 'package:simple_shopping/views/auxiliarboxes/product_list_container.dart';
import 'package:simple_shopping/views/auxiliarboxes/search_container.dart';

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

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    UnmodifiableListView<Product> _list =
        context.watch<ApiController>().products;
    return Scaffold(
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu_rounded),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: Colors.blue[200],
          iconTheme: const IconThemeData(color: Colors.black),
          title: const AppHomeBar(actualroute: AppRoutes.home,)),
      body: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          // Barra de busqueda
          const SearchBox(),
          // Lista de productos de la tienda
          Expanded(
            child: ListView.builder(
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ProductListContainer(_list[index]),
                );
              },
            ),
          ),
        ],
      ),
      drawer: const PanelLateral(),
    );
  }
}
