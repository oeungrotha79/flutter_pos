import 'package:flutter/material.dart';
import 'package:pos_mobile/provider/app_provider.dart';
import 'package:pos_mobile/screens/login_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:pos_mobile/screens/home_screen.dart';
import 'package:pos_mobile/screens/product_detail_screen.dart';
import 'package:pos_mobile/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) {
        return MultiProvider(
          providers: providers,
          child: MyApp());
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'POS System',
      home: SplashScreen(),
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blue,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Color(0xFFF2F2F2),
      ),
    );
  }
}
