import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_shopping/settings/app_api_url.dart';

class CategoryModel {
  Future<List<String>> fetchcategorieslist() async {
    var url = Uri.parse(AppAPIUrl.getAllcategories);

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> rawdata = jsonDecode(response.body);
        List<String> categories = rawdata.cast();

        return categories;
      } else {
        throw 'Request failed with status: ${response.statusCode}';
      }
    } catch (e) {
      throw 'Exception occurred: $e';
    }
  }
}
