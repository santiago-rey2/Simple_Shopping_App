import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable()
class User {
  int id;
  String email;
  String password;
  String name;
  String role;
  String avatar;

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.password,
      required this.role,
      required this.avatar});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return 'User  id : $id email : $email password : $password name : $name role : $role ';
  }
}
