import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/models/users/users.dart';
import 'package:simple_shopping/screens/auxiliarboxes/common/apphomebar.dart';
import 'package:simple_shopping/settings/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  final usernamestyle = const TextStyle(fontSize: 25,fontWeight: FontWeight.w400);
  final userdatadecoration = const BoxDecoration(color: AppColors.brandLightGreyColor, borderRadius: BorderRadius.all(Radius.circular(4)));

  @override
  Widget build(BuildContext context) {
    User? userdata = context.watch<ApiController>().getuserData;
    
    String finalusername;
    if (userdata == null) {
      finalusername = 'No User';
    } else {
      finalusername = userdata.username;
    }

    return Scaffold(
        appBar: const AppHomeBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.only(top: 20,left: 50) ,
              height: 40,
              width: double.infinity,
              child: Text('User: $finalusername',
                          style: usernamestyle,
                          textAlign: TextAlign.start,
                          )
              ),
              Container(
                width: double.infinity,
                decoration: userdatadecoration ,
                child: Text('Hola'),
              ),
          ]),
        ));
  }
}
