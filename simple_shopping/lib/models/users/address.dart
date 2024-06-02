import 'package:json_annotation/json_annotation.dart';
import 'geolocation.dart';

part 'address.g.dart';

@JsonSerializable()
class Address {
  Geolocation geolocation;
  String city;
  String street;
  int number;
  String zipcode;

  Address({
    required this.geolocation,
    required this.city,
    required this.street,
    required this.number,
    required this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  @override
  String toString() {
    return '$city, $street $number ';
  }
}
