import 'package:flutter/material.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/settings/app_routes.dart';

class ProductListContainer extends StatelessWidget {
  final Product item;

  const ProductListContainer(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final Size windowsize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.productview,arguments: item);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            item.image,
            width: 80,
            height: 80,
          ),
          const SizedBox(
            width: 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                width: windowsize.width - 92,
                child: Text(
                  item.title,
                  softWrap: true,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                '${item.price} €',
                softWrap: true,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              )
            ],
          )
        ],
      ),
    );
  }
}
