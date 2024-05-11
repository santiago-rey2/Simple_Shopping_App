import 'package:json_annotation/json_annotation.dart';
import 'rating.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  @override
  String toString() {
    return 'Product(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating)';
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
