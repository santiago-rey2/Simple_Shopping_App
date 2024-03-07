import 'dart:convert';
import 'package:simple_shopping/models/product/product.dart';

class ProductsModel {
  
  List<Product> fetchproductslist(var response) {
    List<dynamic> data = json.decode(response.body);
    List<Product> products = [];
    data.forEach((element) {
      products.add(Product.fromJson1(element));
    });
    return products;
  }
}
