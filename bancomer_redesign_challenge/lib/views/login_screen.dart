import 'package:bancomer_redesign_challenge/theme.dart';
import 'package:bancomer_redesign_challenge/views/home_screen.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        color: BBVAColors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 25.0),
            Expanded(
              flex: 5,
              child: _LoginActions(),
            ),
            Expanded(
              flex: 2,
              child: _LoginButtons(),
            ),
          ],
        ),
      ),
    );
  }
}

class _LoginButtons extends StatelessWidget {
  const _LoginButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _LoginButtonItem(
          text: 'Token móvil',
          icon: Icons.shield,
        ),
        Spacer(),
        _LoginButtonItem(
          text: 'Operación\nQR + CoDi',
          icon: Icons.qr_code_outlined,
        ),
        Spacer(),
        _LoginButtonItem(
          text: 'Línea BBVA',
          icon: Icons.phone_in_talk,
        ),
        Spacer(),
      ],
    );
  }
}

class _LoginButtonItem extends StatelessWidget {
  final String text;
  final IconData icon;

  const _LoginButtonItem({Key key, @required this.text, @required this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: BBVAColors.primary,
          size: 30,
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: TextStyle(color: BBVAColors.primary, fontSize: 16),
        ),
      ],
    );
  }
}

class _LoginActions extends StatelessWidget {
  const _LoginActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen()));
              },
              child: Container(
                width: 35.0,
                height: 35.0,
                decoration: BoxDecoration(color: BBVAColors.primary, shape: BoxShape.circle),
                child: Icon(
                  Icons.swap_horiz,
                  size: 25.0,
                  color: BBVAColors.white,
                ),
                // onPressed: () {},
              ),
            )
          ],
        ),
        const SizedBox(height: 30),
        Text(
          'Hola, Christopher',
          style: TextStyle(color: BBVAColors.primary, fontWeight: FontWeight.bold, fontSize: 35),
        ),
        Text(
          '¿Qué tal tu día hoy?',
          style: TextStyle(color: BBVAColors.primaryLight, fontWeight: FontWeight.w300, fontSize: 18),
        ),
        const SizedBox(height: 30),
        TextField(
          decoration: InputDecoration(
              suffixIcon: Icon(
                Icons.remove_red_eye_outlined,
                color: BBVAColors.primary,
              ),
              labelText: 'Contraseña',
              labelStyle: TextStyle(color: BBVAColors.primary),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: BBVAColors.primary),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: BBVAColors.primary),
              )),
          style: TextStyle(
            color: BBVAColors.primary,
            decorationColor: Colors.yellow,
          ),
          cursorColor: BBVAColors.primary,
          obscureText: true,
        ),
        const SizedBox(height: 20),
        Text(
          'Olvidé mi contraseña',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: BBVAColors.primary,
            fontWeight: FontWeight.w300,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
