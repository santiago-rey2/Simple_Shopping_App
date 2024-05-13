import 'dart:convert';
import 'package:simple_shopping/models/product/product.dart';

class ProductsModel {
  List<Product> fetchproductslist(var response) {
    List<dynamic> data = json.decode(response.body);
    List<Product> products = List.from(data.map((e) => Product.fromJson(e)));
    return products;
  }
}
