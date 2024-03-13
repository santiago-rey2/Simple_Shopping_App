import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/views/home.dart';
import 'package:simple_shopping/views/loginpage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ApiController(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping_App', 
      initialRoute: '/',
      //Routes to navigate from app Screens
      routes: {
        //Charge login Page, its launched ppal
        '/' :(context) => LoginPage(),
        // Charge screen with full list view of products
        '/productlist' :(context) => const HomePage(),
      },
      );
  }
}
