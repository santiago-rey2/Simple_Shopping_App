import 'package:flutter/material.dart';
import 'package:simple_shopping/models/product/product.dart';
import 'package:simple_shopping/views/loginpage.dart';
import 'package:simple_shopping/screens/productlist.dart';
import 'package:simple_shopping/screens/productview.dart';
import 'package:simple_shopping/views/sigin.dart';
import 'package:simple_shopping/settings/app_routes.dart';
import 'package:simple_shopping/settings/app_text.dart';
import 'package:simple_shopping/settings/themes.dart';
import 'package:simple_shopping/screens/cartlist.dart';
import 'package:simple_shopping/views/home.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      title: AppText.apptitle,
      initialRoute: AppRoutes.log,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case AppRoutes.productlist:
            return MaterialPageRoute(builder: (context) => const ProductList());
          case AppRoutes.productview:
            return MaterialPageRoute(
                builder: (context) =>
                    ProductView(item: settings.arguments as Product));
          case AppRoutes.cartview:
            return MaterialPageRoute(builder: (context) => const CartList());
          case AppRoutes.signin:
            return MaterialPageRoute(builder: (context) => const SignInPage());
          case AppRoutes.home:
            return MaterialPageRoute(builder: (context) => const HomePage() );
          default:
            return MaterialPageRoute(builder: (context) => const LoginPage());
        }
      },
    );
  }
}
