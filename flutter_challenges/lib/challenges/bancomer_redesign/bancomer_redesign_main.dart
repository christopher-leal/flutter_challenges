import 'package:flutter/material.dart';
import 'package:flutter_challenges/challenges/bancomer_redesign/views/login_screen.dart';

void main() => runApp(BancomerRedesignMain());

class BancomerRedesignMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BBVA',
      home: LoginScreen(),
    );
  }
}
