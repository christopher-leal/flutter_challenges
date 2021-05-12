import 'package:flutter/material.dart';

import 'pages/home_page.dart';

class ExpandableBottomNavMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: HomePage(),
    );
  }
}
