import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:simple_shopping/models/cartproduct/cartproduct.dart';
import 'package:simple_shopping/models/model.dart';
import 'package:simple_shopping/models/product/category.dart';
import 'package:simple_shopping/models/product/product.dart';

class ApiController extends ChangeNotifier {
  final APIModels _model = APIModels();

  List<Product> _products = [];
  final List<CartProduct> _cart = [];
  List<ProductCategory> _categories = [];
  double _totalcartrpice = 0;
  int _quantitie = 1;
  int _bottonNavigationPage = 0;
  ProductCategory _actualcategory = ProductCategory(id: 10, name: 'All');

  UnmodifiableListView<Product> get products => UnmodifiableListView(_products);
  UnmodifiableListView<CartProduct> get cart => UnmodifiableListView(_cart);
  double get totalprice => _totalcartrpice;
  int get cartQuantitie => _quantitie;
  int get getBottonNavigationPage => _bottonNavigationPage;
  List<ProductCategory> get categories => _categories;
  ProductCategory get actualcategory => _actualcategory;

  void getAllProsducts() async {
    _products = await _model.fetchAllProducts();
    notifyListeners();
  }

  void getCategories() async {
    _categories = await _model.fetchCategories();
    _categories.add(ProductCategory(id: 10, name: 'All'));
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

  void setCategory(ProductCategory value) {
    _actualcategory = value;
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
}
