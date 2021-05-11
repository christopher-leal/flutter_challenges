import 'package:flutter/material.dart';

import '../theme.dart';

class Background extends StatelessWidget {
  final Color color;
  final Widget child;
  const Background({Key key, @required this.color, @required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: color,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 15),
                child: child,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: BBVAColors.secondary,
          ),
        ),
      ],
    );
  }
}
