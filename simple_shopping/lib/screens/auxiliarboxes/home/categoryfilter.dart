import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';

class CategoryFilter extends StatefulWidget {
  final List<String> categories;
  const CategoryFilter({super.key,required this.categories});

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
        value: context.watch<ApiController>().actualCategory,
        borderRadius: BorderRadius.circular(8),
        isExpanded: true,
        underline: Container(height: 0),
        onChanged: (String? value) {
          context.read<ApiController>().setCategory(value!);
        },
        items: widget.categories.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList());
  }
}
