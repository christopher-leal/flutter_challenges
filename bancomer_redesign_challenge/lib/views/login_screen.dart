import 'package:bancomer_redesign_challenge/theme.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: BBVAColors.primary,
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: BBVAColors.white,
        title: Image.asset(
          'assets/bbva.png',
          color: BBVAColors.primary,
          width: size.width * 0.3,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(25.0),
        color: BBVAColors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 45.0,
                    backgroundImage: AssetImage('assets/user.png'),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: BoxDecoration(color: BBVAColors.primary, shape: BoxShape.circle),
                    child: Icon(
                      Icons.swap_horiz,
                      size: 25.0,
                      color: BBVAColors.white,
                    ),
                    // onPressed: () {},
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Hola, Christopher',
                style: TextStyle(color: BBVAColors.primary, fontWeight: FontWeight.bold, fontSize: 35),
              ),
              Text(
                '¿Qué tal tu día hoy?',
                style: TextStyle(color: BBVAColors.primaryLight, fontWeight: FontWeight.w300, fontSize: 18),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
