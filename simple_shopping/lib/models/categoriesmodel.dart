import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_shopping/settings/app_url.dart';


class CategoryModel {
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
