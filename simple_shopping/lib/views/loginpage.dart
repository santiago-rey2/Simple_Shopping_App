import 'package:flutter/material.dart';
import 'package:simple_shopping/views/home.dart';

class LoginPage extends StatelessWidget {
  final String logintitle = 'Shopping App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          logintitle,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    foregroundDecoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Colors.grey, style: BorderStyle.solid),
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
                  const SizedBox(height: 4,),
                  Container(
                    foregroundDecoration: BoxDecoration(
                        border: Border.all(
                            width: 2, color: Colors.grey, style: BorderStyle.solid),
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
                  SizedBox(height: 4,),
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    shape: RoundedRectangleBorder(
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
