import 'package:flutter/material.dart';
import 'package:simple_shopping/models/product/product.dart';

class Containerview extends StatelessWidget {
  final Product item;
  final Widget button;

  const Containerview({super.key, required this.item,required this.button});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5, left: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              item.images.first,
              width: 80,
              height: 120,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8, left: 8),
              width: 250,
              child: Text(
                item.title,
                softWrap: true,
                maxLines: 2,
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                textAlign: TextAlign.start,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 4, left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: Text(
                      '${item.price} €',
                      softWrap: true,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  button 
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
