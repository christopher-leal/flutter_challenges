import 'package:flutter/material.dart';
import 'package:flutter_challenges/challenges/bancomer_redesign/bancomer_redesign_main.dart';
import 'package:flutter_challenges/utils/utils.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Challenges',
      theme: ThemeData.dark(),
      home: _BuildListMenu(),
    );
  }
}

class _BuildListMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Proyectos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MaterialButton(
              color: Colors.deepPurple,
              padding: const EdgeInsets.all(15.0),
              child: Text('Bancomer Redesign'),
              onPressed: () {
                Utils.navigateTo(context, BancomerRedesignMain());
              },
            )
          ],
        ),
      ),
    );
  }
}
