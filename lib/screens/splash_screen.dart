import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 300,
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
