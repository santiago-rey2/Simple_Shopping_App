import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/cartproduct/cartproduct.dart';

class CountItemBox extends StatefulWidget {
  final CartProduct item;
  const CountItemBox({super.key,required this.item});

    @override
  State<CountItemBox> createState() => _CountItemBox();

}

class _CountItemBox extends State<CountItemBox>{
  @override
  Widget build(BuildContext context) {
    Icon deleteicon;
    

    if (widget.item.cantidad > 1) {
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
                context.read<ApiController>().removeFromCart(widget.item);
              },
              icon: deleteicon,
              iconSize: 24,
            ),
          ),
          Text('${widget.item.cantidad}'),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.grey[500],
                borderRadius: BorderRadius.circular(8)),
            child: IconButton(
              onPressed: () {
                context.read<ApiController>().addToCart(CartProduct(item: widget.item.item, cantidad: 1));
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
