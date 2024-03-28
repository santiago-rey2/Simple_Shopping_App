import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/views/home.dart';
import 'package:simple_shopping/views/loginpage.dart';
import 'package:simple_shopping/views/productview.dart';

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
      initialRoute: AppRoutes.productlist,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.productlist:
            return MaterialPageRoute(builder: (context) => const HomePage());
          case AppRoutes.productview:
            return MaterialPageRoute(
                builder: (context) =>
                    ProductView(item: settings.arguments as Product));
          default:
            return MaterialPageRoute(builder: (context) => const LoginPage());
        }
      },
    );
  }
}
