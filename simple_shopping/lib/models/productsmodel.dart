import 'dart:convert';
import 'package:simple_shopping/models/product/product.dart';
import 'package:http/http.dart' as http;
import 'package:simple_shopping/settings/app_api_url.dart';

class ProductsModel {

  Future<List<Product>> fetchproducts() async {
    var url = Uri.parse(AppAPIUrl.getallproducts);

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<Product> products = List.from(data.map((e) => Product.fromJson(e)));
        return products;
      } else {
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Exception occurred: $e';
    }
  }

}
