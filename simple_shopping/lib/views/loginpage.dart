import 'package:flutter/material.dart';
import 'package:simple_shopping/settings/app_text.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _loginKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[200],
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            margin: const EdgeInsetsDirectional.only(top: 100),
            child: const Text(
              AppText.hello,
              style: TextStyle(
                  fontSize: 48, color: Color.fromARGB(255, 46, 121, 250)),
            ),
          ),
          Form(
              key: _loginKey,
              child: Column(
                children: [
                  //Box de texto para introducir el usuario
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    foregroundDecoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Colors.grey,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin:
                        const EdgeInsets.only(top: 128, left: 30, right: 30),
                    child: TextFormField(
                      validator: (value) {
                        return (value != null && !value.contains('@'))
                            ? 'You need to introduce email how example@email'
                            : null;
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: AppText.usernameexample,
                          labelText: AppText.username),
                    ),
                  ),
                  //Input Box de texto para introducir la contraseña del usuario
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10)),
                    foregroundDecoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: Colors.grey,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    margin: const EdgeInsets.only(top: 4, left: 30, right: 30),
                    child: TextFormField(
                      validator: (value) {
                        if(value == null){
                          return 'Introduce password';
                        }
                        if(value!.length < 8){
                          return 'Password need to be almost 8 caracters';
                        }
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: AppText.password,
                          labelText: AppText.password),
                    ),
                  ),
                ],
              )),
          //Boton de acceso al log
          Container(
            width: 330,
            height: 50,
            margin: const EdgeInsets.only(top: 60),
            child: FloatingActionButton.extended(
              onPressed: () {
                if(_loginKey.currentState!.validate()){
                  debugPrint('Todos los campos validados');
                  Navigator.pushReplacementNamed(context, '/productlist');
                };
               
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              label: const Text(
                AppText.login,
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
