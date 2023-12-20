import 'dart:convert';

import 'package:eventement_mobile/ui/pages/Login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:eventement_mobile/constant/AppConstatnt.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController usernameController = new TextEditingController();
  //Password Field obscureText  Handler
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void registerUser() async {
    if (nameController.text.isNotEmpty &&
        usernameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      var requestBody = {
        "name": nameController.text,
        "username": usernameController.text,
        "email": emailController.text,
        "password": passwordController.text,
      };
      try {
        final http.Response response = await http.post(
          Uri.parse(AppConstant.url + 'Auth/Register'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(requestBody),
        );
        print("register .");

        if (response.statusCode == 200) {
          print("Register successful");
          print(response.body);
          Navigator.pushNamed(context, 'home');
        } else {
          print("register failed with status code: ${response.statusCode}");
          print(response.body);
        }
      } catch (error) {
        print(error);
      }
    }
  }

  bool isChecked = false;
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
                padding: const EdgeInsets.only(top: 1),
                child: Image.asset(
                    "assets/images/airy-safe-authorization-and-password-protection.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1, left: 10),
                child: Container(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    labelText: 'Name',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    fillColor: Colors.grey.shade100,
                    prefixIcon: const Icon(Icons.person),
                    labelText: 'Username',
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        )),
                  ),
                ),
              ),
              // Email TextField
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: const Icon(Icons.email),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              // Password TextField
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the password';
                    } else if (value.length <= 6) {
                      return 'Password must be greater than 6 digits';
                    }
                  },
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
                    // hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              // Login Button
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromRGBO(
                        85, 105, 254, 1.0), // Sets the background color
                  ),
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  onPressed: () {
                    registerUser();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    const Text("Already have an account?"),
                    TextButton(
                      onPressed: () {
                        // Navigate to the desired widget when "Sign up" is clicked
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const LoginPage(), // Replace YourSignupWidget with your actual signup widget
                          ),
                        );
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                          color: Color.fromRGBO(
                              85, 105, 254, 1.0), // Set the text color to blue
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
