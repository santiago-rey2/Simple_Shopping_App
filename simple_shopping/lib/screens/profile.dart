import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shopping/controllers/apicontroller.dart';
import 'package:simple_shopping/screens/auxiliarboxes/common/apphomebar.dart';
import 'package:simple_shopping/settings/colors.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final usernamestyle =
      const TextStyle(fontSize: 25, fontWeight: FontWeight.w400);
  final userdatadecoration = const BoxDecoration(
      color: AppColors.brandLightGreyColor,
      borderRadius: BorderRadius.all(Radius.circular(4)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppHomeBar(),
        body: FutureBuilder(
          future:
              Provider.of<ApiController>(context, listen: false).getUserData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return Consumer<ApiController>(
                  builder: (context, apiController, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(children: [
                    Container(
                        margin: const EdgeInsets.only(top: 20, left: 25),
                        height: 40,
                        width: double.infinity,
                        child: 
                        Text(
                          'User: ${apiController.userdata?.username}',
                          style: usernamestyle,
                          textAlign: TextAlign.start,
                        )),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                      decoration: userdatadecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Datos personales : ',textAlign: TextAlign.start,),
                          Text('  Nombre : ${apiController.userdata?.name?.firstname}'),
                          Text('  Apellidos : ${apiController.userdata?.name?.lastname}'),
                          Text('Dirección de facturación : ${apiController.userdata?.address}')
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                      margin: const EdgeInsets.only(top: 4),
                      decoration: userdatadecoration,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Direcciones de envío : ',textAlign: TextAlign.start,),
                          Row(
                            children: [
                              const Icon(Icons.location_on_outlined,color: Colors.black,),
                              Text('${apiController.userdata?.address}')
                            ],
                          )
                          
                        ],
                      ),
                    ),
                  ]),
                );
              });
            }
          },
        ));
  }
}
