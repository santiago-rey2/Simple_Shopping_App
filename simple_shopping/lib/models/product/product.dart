import 'dart:convert';
import 'rating.dart';

class Product {
  int? id;
  String title;
  double price;
  String? description;
  String? category;
  String image;
  Rating? rating;

  Product({
    this.id,
    required this.title,
    required this.price,
    this.description,
    this.category,
    required this.image,
    this.rating,
  });

  @override
  String toString() {
    return 'Product(id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rating: $rating)';
  }

  factory Product.fromJson1(Map<String, dynamic> data) {
    return Product(
      id: data['id'] as int?,
      title: data['title'] as String,
      price: (data['price'] as num).toDouble(),
      description: data['description'] as String?,
      category: data['category'] as String?,
      image: data['image'] as String,
      rating: data['rating'] == null
          ? null
          : Rating.fromJson1(data['rating'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson1() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rating': rating?.toJson1(),
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Product].
  factory Product.fromJson(String data) {
    return Product.fromJson1(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Product] to a JSON string.
  String toJson() => json.encode(toJson1());

  Product copyWith({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    Rating? rating,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      category: category ?? this.category,
      image: image ?? this.image,
      rating: rating ?? this.rating,
    );
  }
}
