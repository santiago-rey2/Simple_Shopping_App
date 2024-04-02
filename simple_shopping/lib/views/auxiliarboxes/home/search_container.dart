import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      foregroundDecoration: BoxDecoration(
          border: Border.all(
              width: 2, color: Colors.grey, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(8.0)
          ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: const TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search...',
            icon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }
}
