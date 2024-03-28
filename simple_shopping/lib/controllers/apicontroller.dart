import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:http/http.dart' as http;
import 'package:simple_shopping/models/productsmodel.dart';

class ApiController extends ChangeNotifier {
  final ProductsModel _model = ProductsModel();

  List<Product> _products = [];
  List<Product> _cart = [];
  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);
  UnmodifiableListView<Product> get cart => UnmodifiableListView(_cart);

  void getAllProsducts() async {
    _products = await _fetchproducts();
    notifyListeners();
  }
  
  void addToCart(Product p){
    _cart.add(p);
  }
  

  Future<List<Product>> _fetchproducts() async {
    var url = Uri.parse('https://fakestoreapi.com/products');

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        return _model.fetchproductslist(response);
      } else {
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Exception occurred: $e';
    } 
  }
}
