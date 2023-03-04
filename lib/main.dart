import 'package:flutter/material.dart';
import 'bottom_nav.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    home: const MyHomePage(),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController userNameTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  bool _validateUserNameTextEditingController = false;
  bool _validatePasswordTextEditingController = false;

  void _logiButtonPressed() {
    setState(() {
      userNameTextEditingController.text.isEmpty
          ? _validateUserNameTextEditingController = true
          : _validateUserNameTextEditingController = false;

      passwordTextEditingController.text.isEmpty
          ? _validatePasswordTextEditingController = true
          : _validatePasswordTextEditingController = false;

      // if (userNameTextEditingController.text == 'Admin' &&
      //     passwordTextEditingController.text == '1234') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const BottomNav()),
      );
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Column(
            children: [
              //app bar
              const SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'lib/assets/images/medical.png',
                  height: 240,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Login
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Login ',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple[400],
                          fontSize: 24),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: userNameTextEditingController,
                    decoration: InputDecoration(
                      // fillColor: Colors.deepPurple[200],
                      // filled: true,
                      prefixIcon: const Icon(Icons.email),
                      border: InputBorder.none,
                      hintText: 'User Name',
                      errorText: _validateUserNameTextEditingController
                          ? 'User Name Can\'t Be Empty'
                          : null,
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    obscureText: true,
                    controller: passwordTextEditingController,
                    decoration: InputDecoration(
                      // fillColor: Colors.deepPurple[200],
                      // filled: true,
                      prefixIcon: const Icon(Icons.lock),
                      border: InputBorder.none,
                      hintText: 'Password',
                      errorText: _validatePasswordTextEditingController
                          ? 'Password Can\'t Be Empty'
                          : null,
                      hintStyle: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: double.infinity,
                  height: 55,
                  // color: Colors.deepPurple[200],
                  child: ElevatedButton(
                    onPressed: _logiButtonPressed,
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
