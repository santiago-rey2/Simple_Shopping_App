import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/product/category.dart';
import 'package:simple_shopping/screens/auxiliarboxes/common/apphomebar.dart';
import 'package:simple_shopping/screens/auxiliarboxes/home/filter_by_category.dart';
import 'package:simple_shopping/screens/auxiliarboxes/product/product_list_container.dart';
import 'package:simple_shopping/settings/colors.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    super.initState();
    Provider.of<ApiController>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductCategory> categories =
        context.watch<ApiController>().categories;

    return Scaffold(
        appBar: const AppHomeBar(),
        body: Column(
          children: [
            SizedBox(
              height: 45,
              child: Row(
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      width: 150,
                      child: FilterCategories(
                        categories: categories,
                      )),
                  Container(
                    width: 1,
                    decoration: const BoxDecoration(
                        color: AppColors.brandDivisorLineColor),
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      child: const Text('Dirección'))
                ],
              ),
            ),
            Container(
              height: 1,
              decoration:
                  const BoxDecoration(color: AppColors.brandDivisorLineColor),
            ),
            // Lista de productos de la tienda
            Expanded(
              child: ListView.builder(
                itemCount: context.watch<ApiController>().products.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ProductListContainer(
                        context.watch<ApiController>().products[index]),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
