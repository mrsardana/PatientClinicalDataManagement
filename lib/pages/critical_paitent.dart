import 'package:flutter/material.dart';

class CriticalPaitent extends StatefulWidget {
  const CriticalPaitent({super.key});

  @override
  State<CriticalPaitent> createState() => _CriticalPaitentState();
}

class _CriticalPaitentState extends State<CriticalPaitent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              // App bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Critical Patients',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              // To Update
            ],
          ),
        ),
      ),
    );
  }
}
