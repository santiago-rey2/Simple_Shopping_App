import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:simple_shopping/models/cartproduct/cartproduct.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:http/http.dart' as http;
import 'package:simple_shopping/models/productsmodel.dart';

class ApiController extends ChangeNotifier {
  final ProductsModel _model = ProductsModel();

  List<Product> _products = [];
  List<CartProduct> _cart = [];
  double _totalcartrpice = 0;
  int _quantitie = 1;
  int _bottonNavigationPage = 0;

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);
  UnmodifiableListView<CartProduct> get cart => UnmodifiableListView(_cart);
  double get totalprice => _totalcartrpice;
  int get cartQuantitie => _quantitie;
  int get getBottonNavigationPage => _bottonNavigationPage;

  void getAllProsducts() async {
    _products = await _fetchproducts();
    notifyListeners();
  }

  void addToCart(CartProduct p) {
    if (!_cart.contains(p)) {
      _cart.add(p);
    } else {
      int aux = _cart.indexOf(p);
      _cart.elementAt(aux).increaseCount(p.cantidad);
    }
    _totalcartrpice = double.parse(
        (_totalcartrpice + p.item.price * p.cantidad).toStringAsFixed(2));
    notifyListeners();
  }

  void removeFromCart(CartProduct p) {
    int aux = _cart.indexOf(p);
    if (_cart.elementAt(aux).cantidad > 1) {
      _cart.elementAt(aux).decreaseCount(1);
    } else {
      _cart.remove(p);
    }
    _totalcartrpice =
        double.parse((_totalcartrpice - p.item.price).toStringAsFixed(2));
    notifyListeners();
  }

  void setQuantitie(int value) {
    _quantitie = value;
    notifyListeners();
  }

  void changePage(int value) {
    _bottonNavigationPage = value;
    notifyListeners();
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
