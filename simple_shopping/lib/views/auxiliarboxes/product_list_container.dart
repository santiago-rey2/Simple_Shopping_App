import 'package:flutter/material.dart';
import 'package:simple_shopping/views/productview.dart';

class Product_List_Container extends StatelessWidget {
  final String title;
  final String image;
  final double price;

  Product_List_Container(this.title, this.image, this.price);

  @override
  Widget build(BuildContext context) {
    final Size windowsize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Product_View(
                      image: image,
                      name: title,
                    )));
        print(' Box: $title was tapped ');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            image,
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
                  title,
                  softWrap: true,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '$price €',
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
