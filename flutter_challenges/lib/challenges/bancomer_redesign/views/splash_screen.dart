import 'package:flutter/material.dart';

import '../theme.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: BBVAColors.primary,
      child: Center(
        child: Image.asset('assets/bancomer/bbva.png'),
      ),
    ));
  }
}
