import 'package:flutter/material.dart';

import 'views/messages_page.dart';

class AndroidMessagesAppMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: MessagesPage(),
    );
  }
}
