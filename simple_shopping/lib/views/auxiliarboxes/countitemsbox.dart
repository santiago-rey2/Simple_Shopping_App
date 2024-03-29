import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/cartproduct/cartproduct.dart';

class CountItemBox extends StatefulWidget {
  final CartProduct item;
  const CountItemBox({super.key,required this.item});

    @override
  State<CountItemBox> createState() => _CountItemBox(item: item);

}

class _CountItemBox extends State<CountItemBox>{
  CartProduct item;
  _CountItemBox({required this.item});
  @override
  Widget build(BuildContext context) {
    Icon deleteicon;
    

    if (item.cantidad > 1) {
      deleteicon = const Icon(Icons.remove_rounded);
    } else {
      deleteicon = const Icon(Icons.delete_rounded);
    }

    return Container(
      width: 140,
      height: 40,
      decoration: BoxDecoration(
          color: Colors.grey[400], borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(8)),
            child: IconButton(
              onPressed: () {
                context.read<ApiController>().removeFromCart(item);
              },
              icon: deleteicon,
              iconSize: 24,
            ),
          ),
          Text('${item.cantidad}'),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(8)),
            child: IconButton(
              onPressed: () {
                context.read<ApiController>().addToCart(item);
              },
              icon: const Icon(Icons.add_rounded),
              iconSize: 24,
            ),
          )
        ],
      ),
    );
  }
  

}
