import 'dart:convert';

import 'package:eventement_mobile/cache/cacheHelper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eventement_mobile/constant/AppConstatnt.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void loginUser1() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      var reqBody = {
        "email": emailController.text,
        "password": passwordController.text
      };
      try {
        final http.Response response = await http.post(
          Uri.parse(AppConstant.url + 'Auth/Login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(reqBody),
        );

        if (response.statusCode == 200) {
          print("Login successful");

          String token = response.body;
          CacheData.setData(key: "token", value: token);
          //debugPrint(CacheData.getData(key: "token"));
          Navigator.pushNamed(context, 'home');
        } else {
          print("Login failed with status code: ${response.statusCode}");
          print(response.body);
        }
      } catch (error) {
        print("Error during login: $error");
      }
    }
  }

  // Handle login logic
  void _handleLogin() async {
    try {
      // If login is successful, navigate to the 'home' route
      Navigator.pushNamed(context, 'home');
    } catch (e) {
      // Handle login error (display a snackbar, show an error message, etc.)
      print("Error during login: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(
                    "assets/images/airy-safe-authorization-and-password-protection.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email_outlined),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: _isHidden,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    fillColor: Colors.grey.shade100,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: _toggleVisibility,
                      icon: _isHidden
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(85, 105, 254, 1.0),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: loginUser1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'Register');
                      },
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          color: Color.fromRGBO(85, 105, 254, 1.0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
