import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:simple_shopping/models/product/product.dart';

class Ratings extends StatelessWidget {
  final Product item;
  const Ratings({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: item.rating.rate,
      valueLabelColor: Colors.transparent,
      valueLabelTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          fontSize: 12.0),
      starOffColor: Colors.grey,
      starColor: const Color.fromARGB(255, 236, 182, 2),
    );
  }
}
