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
              height: 130,
              
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8, left: 8),
              width: 240,
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
              margin: const EdgeInsets.only(top: 4, left: 8,bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
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
