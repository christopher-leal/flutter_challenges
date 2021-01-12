import 'package:bancomer_redesign_challenge/views/login_screen.dart';
import 'package:bancomer_redesign_challenge/views/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BBVA',
      home: LoginScreen(),
    );
  }
}
