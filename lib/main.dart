import 'package:flutter/material.dart';

import 'package:yan/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Food Delivery UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey [50],
        primaryColor:Colors.deepOrangeAccent,

      ),
      home:  SplashScreen(),
    );
  }
}

