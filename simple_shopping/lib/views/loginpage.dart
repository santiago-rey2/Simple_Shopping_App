import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final String logintitle = 'Shopping App';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          logintitle,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Box de texto para introducir el usuario
                  Container(
                    foregroundDecoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Colors.grey,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Username',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  //Input Box de texto para introducir la contraseña del usuario
                  Container(
                    foregroundDecoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Colors.grey,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Password',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  //Boton de acceso al log
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/productlist');
                    },
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    label: const Text(
                      'Log in',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
