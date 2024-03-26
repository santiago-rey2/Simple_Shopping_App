import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/product/product.dart';
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
        backgroundColor: Colors.blue[200],
        title: const Text(
          'Shopping_App',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
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
      drawer: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: const IconThemeData(color: Colors.black)),
        child: const Drawer(),
      ),
    );
  }
}
