import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/views/auxiliarboxes/custom_container.dart';

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
        title: Text('Shopping_App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Search...'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _list.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(4.0),
                  child:Custom_Container(
                    _list[index].title, 
                    _list[index].description,
                    _list[index].image, 
                    _list[index].price
                    ),
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
