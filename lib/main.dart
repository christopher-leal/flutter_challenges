import 'package:flutter/material.dart';
import 'package:messages_app_challenge/views/messages_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MessagesApp',
      home: MessagesPage(),
      theme: ThemeData.dark(),
    );
  }
}
