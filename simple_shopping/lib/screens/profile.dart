import 'package:flutter/material.dart';
import 'package:simple_shopping/screens/auxiliarboxes/common/apphomebar.dart';
import 'package:simple_shopping/settings/app_text.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: AppHomeBar(), body: Center(child: Text(AppText.profile)));
  }
}
