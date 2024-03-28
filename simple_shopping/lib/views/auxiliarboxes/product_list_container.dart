import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/views/auxiliarboxes/ratingsstars.dart';

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
            color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5, left: 8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  item.image,
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
                    style: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 16),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 14, left: 8),
                    height: 24,
                    child: Ratings(item: item)),
                Container(
                  margin: const EdgeInsets.only(top: 4, left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        child: Text(
                          '${item.price} €',
                          softWrap: true,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Container(
                        width: 130,
                        height: 20,
                        margin: const EdgeInsets.only(left: 30),
                        child: FloatingActionButton.extended(
                            onPressed: () {
                              debugPrint('Añadido al carrito');
                              context.read<ApiController>().addToCart(item);
                            },
                            label: const Text('Añadir al carrito',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black)),
                            backgroundColor: Colors.amber[400],
                            heroTag: Text(item.title)
                          ),
                      )
                    ],
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
