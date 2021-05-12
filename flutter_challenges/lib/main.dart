import 'package:flutter/material.dart';
import 'package:flutter_challenges/challenges/android_messages/android_messages_main.dart';
import 'package:flutter_challenges/challenges/bancomer_redesign/bancomer_redesign_main.dart';
import 'package:flutter_challenges/challenges/expandable_bottom_nav/expandable_bottom_nav_main.dart';
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
      body: ListView(
        padding: const EdgeInsets.all(15.0),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MaterialButton(
              color: Colors.deepPurple,
              padding: const EdgeInsets.all(15.0),
              child: Text('Bancomer Redesign'),
              onPressed: () {
                Utils.navigateTo(context, BancomerRedesignMain());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MaterialButton(
              color: Colors.deepPurple,
              padding: const EdgeInsets.all(15.0),
              child: Text('Expandable Bottom Nav'),
              onPressed: () {
                Utils.navigateTo(context, ExpandableBottomNavMain());
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: MaterialButton(
              color: Colors.deepPurple,
              padding: const EdgeInsets.all(15.0),
              child: Text('Android Messages App'),
              onPressed: () {
                Utils.navigateTo(context, AndroidMessagesAppMain());
              },
            ),
          ),
        ],
      ),
    );
  }
}
