import 'package:json_annotation/json_annotation.dart';

part 'geolocation.g.dart';

@JsonSerializable()
class Geolocation {
  String lat;
  String long;

  Geolocation({required this.lat,required this.long});

  factory Geolocation.fromJson(Map<String, dynamic> json) => _$GeolocationFromJson(json);

  Map<String, dynamic> toJson() => _$GeolocationToJson(this);

  
}
