import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class ExpandableBottomNavMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expandable bottom nav',
      home: HomePage(),
    );
  }
}
