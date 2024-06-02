import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class ProductCategory {
  int id;
  String name;
  String? image;

  ProductCategory({required this.id, required this.name, this.image});

  @override
  String toString() {
    return name;
  }

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
}
