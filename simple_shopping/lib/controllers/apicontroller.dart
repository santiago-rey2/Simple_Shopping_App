import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:simple_shopping/models/cartproduct/cartproduct.dart';
import 'package:simple_shopping/models/categoriesmodel.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/models/productsmodel.dart';
import 'package:simple_shopping/models/usermodel.dart';
import 'package:simple_shopping/models/users/users.dart';

class ApiController extends ChangeNotifier {
  final ProductsModel _pmodel = ProductsModel();
  final CategoryModel _cmodel = CategoryModel();
  final UserModel _userModel = UserModel();

  List<Product> _products = [];
  List<CartProduct> _cart = [];
  List<String> _categories = [];
  List<Product> _productsview = [];
  double _totalcartrpice = 0;
  int _quantitie = 1;
  int _bottonNavigationPage = 0;
  String _actualcategory = '';
  User? _userdata;

  UnmodifiableListView<Product> get products =>
      UnmodifiableListView(_productsview);
  UnmodifiableListView<CartProduct> get cart => UnmodifiableListView(_cart);
  List<String> get category => _categories;
  double get totalprice => _totalcartrpice;
  int get cartQuantitie => _quantitie;
  int get getBottonNavigationPage => _bottonNavigationPage;
  String get actualCategory => _actualcategory;
  User? get getuserData => _userdata;

  void getAllProducts() async {
    _products = await _pmodel.fetchproducts();
    filterobjects('All');
    notifyListeners();
  }

  void getAllCategories() async {
    _categories = await _cmodel.fetchcategorieslist();
    _categories.add('All');
    _actualcategory = _categories.last;
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

  void filterobjects(String category) {
    if (_categories.contains(category)) {
      if (category != 'All') {
        _productsview = List.from(
            _products.where((element) => element.category == category));
      } else {
        _productsview = List.from(_products);
      }
    }
    notifyListeners();
  }

  void userLoged() async {
    _userdata = await _userModel.fetchuser();
    notifyListeners();
  }

  void setQuantitie(int value) {
    _quantitie = value;
    notifyListeners();
  }

  void setCategory(String value) {
    _actualcategory = value;
    filterobjects(_actualcategory);
    notifyListeners();
  }

  void changePage(int value) {
    _bottonNavigationPage = value;
    notifyListeners();
  }
}
