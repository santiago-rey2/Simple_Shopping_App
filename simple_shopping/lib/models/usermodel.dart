import 'dart:convert';
import 'package:simple_shopping/models/users/users.dart';
import 'package:http/http.dart' as http;

void main() async {
  User u = await UserModel().fetchuser();
  List<User> users = await UserModel().fetchuserslist();

  User user = User(
      id: 1,
      email: " ",
      password: " ",
      phone: " ",
      username: " ",
      role: "Pepito");

  User user2 = User(
    id: 1,
    email: " ",
    password: " ",
    phone: " ",
    username: " ",
  );

  print(u);
  print(user);
  print(user2);
  print(users);
}

class UserModel {
  Future<User> fetchuser() async {
    var url = Uri.parse('https://fakestoreapi.com/users/1');

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
    var url = Uri.parse('https://fakestoreapi.com/users');

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
