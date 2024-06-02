import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/product/category.dart';

class FilterCategories extends StatefulWidget {
  final List<ProductCategory> categories;
  const FilterCategories({super.key, required this.categories});

  @override
  State<FilterCategories> createState() => _FilterCategoriesState();
}

class _FilterCategoriesState extends State<FilterCategories> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<ProductCategory>(
        value: context.watch<ApiController>().actualcategory,
        borderRadius: BorderRadius.circular(8),
        isExpanded: true,
        underline: Container(height: 0),
        onChanged: (ProductCategory? value) {

        },
        items: widget
            .categories
            .map<DropdownMenuItem<ProductCategory>>((ProductCategory value) {
          return DropdownMenuItem<ProductCategory>(
            value: value,
            child: Text('$value'),
          );
        }).toList());
  }
}
