import 'package:flutter/material.dart';
import 'package:flutter_challenges/challenges/bancomer_redesign/views/login_screen.dart';

class BancomerRedesignMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: LoginScreen(),
    );
  }
}
