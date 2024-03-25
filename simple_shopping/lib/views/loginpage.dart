import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final String logintitle = 'Shopping App';

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[200],
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsetsDirectional.only(top: 100),
            child: const Text(
              'Hello',
              style: TextStyle(
                  fontSize: 48, color: Color.fromARGB(255, 46, 121, 250)),
            ),
          ),
          //Box de texto para introducir el usuario
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            foregroundDecoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Colors.grey, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.only(top: 128, left: 30, right: 30),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Username',
              ),
            ),
          ),
          //Input Box de texto para introducir la contraseña del usuario
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
            foregroundDecoration: BoxDecoration(
                border: Border.all(
                    width: 2, color: Colors.grey, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.only(top: 4, left: 30, right: 30),
            child: const TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
              ),
            ),
          ),
          //Boton de acceso al log
          Container(
            width: 330,
            height: 50,
            margin: const EdgeInsets.only(top: 60),
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/productlist');
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              label: const Text(
                'Log in',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 84, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    'Log In With Google',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    'Log In With Facebook',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
