import 'dart:convert';
import 'package:simple_shopping/models/users/users.dart';
import 'package:http/http.dart' as http;
import 'package:simple_shopping/settings/app_api_url.dart';


class UserModel {
  Future<User> fetchuser() async {
    var url = Uri.parse(AppAPIUrl.getUniqueUser);

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
    var url = Uri.parse(AppAPIUrl.getAllUsers);

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
}
