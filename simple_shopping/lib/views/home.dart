import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/screens/cartlist.dart';
import 'package:simple_shopping/screens/miscelaneous.dart';
import 'package:simple_shopping/screens/productlist.dart';
import 'package:simple_shopping/screens/profile.dart';
import 'package:simple_shopping/settings/app_text.dart';

class HomePage extends StatefulWidget {
  
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<BottomNavigationBarItem> pageListButtons = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        activeIcon: Icon(Icons.home_rounded),
        label: AppText.home),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        activeIcon: Icon(Icons.person),
        label: AppText.profile),
    const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined),
        activeIcon: Icon(Icons.shopping_cart),
        label: AppText.cart),
    const BottomNavigationBarItem(
        icon: Icon(Icons.dehaze_rounded),
        activeIcon: Icon(Icons.dehaze_rounded),
        label: AppText.miscelaneous)
  ];

  @override
  Widget build(BuildContext context) {
    int listCurrentIndex =
        context.watch<ApiController>().getBottonNavigationPage;
    return Scaffold(
      body: IndexedStack(
        index: listCurrentIndex,
        children: const [ProductList(), Profile(), CartList(), Miscelaneous()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: pageListButtons,
        currentIndex: listCurrentIndex,
        selectedIconTheme: const IconThemeData(color: Colors.black),
        unselectedIconTheme: const IconThemeData(color: Colors.black),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          context.read<ApiController>().changePage(value);
        },
      ),
    );
  }
}
