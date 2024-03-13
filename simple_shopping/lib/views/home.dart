import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/views/auxiliarboxes/product_list_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<ApiController>(context, listen: false).getAllProsducts();
  }

  @override
  Widget build(BuildContext context) {
    UnmodifiableListView<Product> _list =
        context.watch<ApiController>().products;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text('Shopping_App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 4,
          ),
          Container(
            foregroundDecoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Colors.grey, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: const TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search...',
                  icon: Icon(Icons.search,color: Colors.grey,)),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _list.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Product_List_Container(
                      _list[index].title,
                      _list[index].image,
                      _list[index].price),
                );
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(),
    );
  }
}
