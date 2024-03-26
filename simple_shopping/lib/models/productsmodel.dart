import 'dart:convert';
import 'package:simple_shopping/models/product/product.dart';

class ProductsModel {
  
  List<Product> fetchproductslist(var response) {
    List<dynamic> data = json.decode(response.body);
    List<Product> products = [];
    for (var element in data) {
      products.add(Product.fromJson1(element));
    }
    return products;
  }
}
