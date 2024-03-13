import 'package:flutter/material.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/views/productview.dart';

class ProductListContainer extends StatelessWidget {
  final Product item;

  const ProductListContainer(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    final Size windowsize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductView(
                      item: item,
                    )
            ));
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
              Container(
                width: windowsize.width - 92,
                child: Text(
                  item.title,
                  softWrap: true,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '${item.price} €',
                softWrap: true,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
