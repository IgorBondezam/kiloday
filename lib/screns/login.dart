import 'package:flutter/material.dart';
import 'package:kiloday/main.dart';
import 'package:kiloday/model/user.dart';
import 'package:kiloday/screns/home.dart';

class Login extends StatefulWidget {
  Login({super.key});

  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'KiloDay',
            style: TextStyle(
                color: MyApp.green,
                fontSize: 75,
                fontWeight: FontWeight.w700),
          ),
          const Padding(padding: EdgeInsets.all(48.0)),
          SizedBox(
            width: 250,
            child: TextField(
              controller: widget.loginController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(8.0)),
          SizedBox(
            width: 250,
            child: TextField(
              controller: widget.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.all(16.0)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: MyApp.green),
            onPressed: () {
              User user = User(
                  widget.loginController.text, widget.passwordController.text);
              if (user.loginValid()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home(
                              user: user,
                            )));
                print(widget.loginController.text);
                print(widget.passwordController.text);
              }
            },
            child: const Text(
              'Entrar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
