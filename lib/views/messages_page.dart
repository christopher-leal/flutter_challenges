import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MessagesPage extends StatefulWidget {
  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  bool expanded = false;
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _CustomFAB(
          expanded: expanded,
          onTap: () {},
        ),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                child: Container(
                  margin: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(10.0)),
                  width: double.infinity,
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      Text('Search'),
                      Spacer(),
                      Icon(Icons.more_vert_rounded),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (notification) {
                    print(_scrollController.position.userScrollDirection);
                    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse && expanded) {
                      setState(() {
                        expanded = false;
                      });
                    } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward && !expanded) {
                      setState(() {
                        expanded = true;
                      });
                    }
                    return true;
                  },
                  child: ListView.builder(
                    controller: _scrollController,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => _Message(
                      i: index,
                    ),
                    itemCount: 30,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class _CustomFAB extends StatelessWidget {
  final bool expanded;
  final VoidCallback onTap;

  const _CustomFAB({this.expanded = false, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    const _minSize = 50.0;
    const _maxSize = 150.0;
    const _iconSize = 24.0;
    final position = _minSize / 2 - _iconSize / 2;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        width: expanded ? _maxSize : _minSize,
        height: _minSize,
        decoration: BoxDecoration(color: Colors.blue[700], borderRadius: BorderRadius.circular(_minSize)),
        child: Stack(
          children: [
            Positioned(
              top: position,
              left: position,
              child: Icon(
                Icons.message,
                color: Colors.white,
              ),
            ),
            Positioned(
                top: position,
                left: position + _iconSize * 1.6,
                child: Text(
                  'Start Chat',
                  style: TextStyle(fontSize: 20.0),
                ))
          ],
        ),
      ),
    );
  }
}

class _Message extends StatelessWidget {
  final int i;

  const _Message({Key key, this.i}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Flutter'),
      subtitle: Text('First flutter challenge'),
      leading: CircleAvatar(
        backgroundColor: Colors.primaries[i % Colors.primaries.length],
        child: Icon(
          Icons.person,
          color: Colors.black,
        ),
      ),
      trailing: Text('today'),
    );
  }
}
