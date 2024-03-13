import 'package:flutter/material.dart';
import 'package:simple_shopping/views/home.dart';

class LoginPage extends StatelessWidget {
  final String logintitle = 'Login Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(logintitle),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                  child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Username',
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
              )),
              const SizedBox(
                height: 4,
              ),
              const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    )),
              ),
              const SizedBox(
                height: 4,
              ),
              FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text('Login'))
            ]),
      ),
    );
  }
}
