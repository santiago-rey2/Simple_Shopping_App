import 'package:json_annotation/json_annotation.dart';
import 'package:simple_shopping/models/users/address.dart';
import 'package:simple_shopping/models/users/name.dart';

part 'users.g.dart';

@JsonSerializable()
class User {
  int id;
  String email;
  String username;
  String password;
  Name? name;
  Address? address;
  String phone;
  String role;

  User(
      {required this.id,
      this.address,
      required this.email,
      this.name,
      required this.password,
      required this.phone,
      required this.username,
      this.role = "Admin"});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
