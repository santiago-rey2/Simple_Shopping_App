import 'package:flutter/material.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/settings/app_routes.dart';

class ProductListContainer extends StatelessWidget {
  final Product item;

  const ProductListContainer(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    //final Size windowsize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productview, arguments: item);
      },
      child: Container(
        width: 344,
        height: 150,
        margin: const EdgeInsets.only(top: 4, left: 8, right: 8),
        decoration: BoxDecoration(
            color: Colors.grey[500], borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5, left: 8),
              child: Image.network(
                item.image,
                width: 80,
                height: 120,
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
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12, bottom: 14, left: 8),
                  height: 24,
                  child: Text(
                    '${item.rating?.rate} ',
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4, left: 8),
                  child: Text(
                    '${item.price} €',
                    softWrap: true,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
