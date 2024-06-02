import 'dart:convert';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/models/users/users.dart';
import 'package:http/http.dart' as http;
import 'package:simple_shopping/settings/app_url.dart';

class APIModels {

  Future<List<Product>> fetchAllProducts() async{
    var url = Uri.parse(AppUrls.productUrlApi);

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return List.from(data.cast());
      } else {
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Exception occurred: $e';
    }
  }

  Future<List<Product>> fetchproducts() async {
    var url = Uri.parse(AppUrls.productUrlApi);

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

  Future<User> fetchuser() async {
    var url = Uri.parse(AppUrls.userUrlApi);

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        Map<String, dynamic> userresponse = jsonDecode(response.body);
        User user = User.fromJson(userresponse);
        return user;
      } else {
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Exception occurred: $e';
    }
  }

  Future<List<User>> fetchuserslist() async {
    var url = Uri.parse(AppUrls.usersUrl);

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> userresponse = jsonDecode(response.body);
        List<User> users = List.from(userresponse.map((e) => User.fromJson(e)));

        return users;
      } else {
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Exception occurred: $e';
    }
  }

  Future<List<String>> fetchCategories() async {
    var url = Uri.parse(AppUrls.categoriesUrlApi);

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return List.from(data.cast());
      } else {
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Exception occurred: $e';
    }
  }
  
}