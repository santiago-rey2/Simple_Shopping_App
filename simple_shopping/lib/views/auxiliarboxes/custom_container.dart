import 'package:flutter/material.dart';

class Custom_Container extends StatelessWidget {
  String title;
  String? description;
  String image;
  double price;

  Custom_Container(this.title, this.description, this.image, this.price);

  @override
  Widget build(BuildContext context) {
    final Size windowsize = MediaQuery.of(context).size;
    return Container(
      child: Row(
       // mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            image,
            width: 80,
            height: 80,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Container(
                width: windowsize.width - 88,
                child: Text(
                title,
                softWrap: true,
                //overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: windowsize.width -88,
                child: Text(
                description ?? '',
                softWrap: true,
                //overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                '$price €',
                softWrap: true,
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
  );
  
  }
}
