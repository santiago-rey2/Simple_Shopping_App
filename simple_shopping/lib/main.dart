import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/app.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ApiController(),
      child: const MainApp(),
    ),
  );
}