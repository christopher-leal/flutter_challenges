import 'package:bancomer_redesign_challenge/theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: BBVAColors.primary,
      child: Center(
        child: Image.asset('assets/bbva.png'),
      ),
    ));
  }
}
