import 'dart:ui';

import 'package:expandable_bottom_nav/models/item.dart';
import 'package:expandable_bottom_nav/utils/data.dart';
import 'package:flutter/material.dart';

const menuCollapsedWidth = 200.0;
const minMenuHeight = 70.0;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _BuildList(),
          _BuildBottomNav(),
        ],
      ),
    );
  }
}

class _BuildBottomNav extends StatefulWidget {
  @override
  __BuildBottomNavState createState() => __BuildBottomNavState();
}

class __BuildBottomNavState extends State<_BuildBottomNav> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isExpanded = false;
  double _currentHeight = menuCollapsedWidth;
  Widget _expandedMenu() {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Column(
          children: [
            SizedBox(
              height: size.width * 0.3,
              width: size.width * 0.3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  'assets/${items[0].bg}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: Axis.vertical,
              spacing: 12.0,
              children: [
                Text(
                  items[0].title,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                Text(
                  items[0].subtitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shuffle,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.pause,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.wifi_tethering_rounded,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _collapsedMenu() {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(Icons.playlist_play_outlined),
            iconSize: 30.0,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.playlist_play_outlined),
            onPressed: () {
              setState(() {
                isExpanded = true;
                _currentHeight = (size.height * 0.6);
                _controller.forward(from: 0.0);
              });
            },
          ),
          CircleAvatar(
            backgroundImage: AssetImage('assets/avatar.jpg'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final maxHeight = size.height * 0.6;
    return GestureDetector(
      onVerticalDragUpdate: isExpanded
          ? (details) {
              setState(() {
                final newHeight = _currentHeight - details.delta.dy;
                _controller.value = _currentHeight / maxHeight;
                _currentHeight = newHeight.clamp(minMenuHeight, maxHeight);
              });
            }
          : null,
      onVerticalDragEnd: (details) {
        if (_currentHeight < maxHeight / 2) {
          _controller.reverse();
          isExpanded = false;
        } else {
          isExpanded = true;
          _controller.forward(from: _currentHeight / maxHeight);
          _currentHeight = maxHeight;
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          final animationValue = const ElasticInOutCurve(0.7).transform(_controller.value);
          return Stack(
            children: [
              Positioned(
                left: lerpDouble(size.width / 2 - menuCollapsedWidth / 2, 0, animationValue),
                width: lerpDouble(menuCollapsedWidth, size.width, animationValue),
                bottom: lerpDouble(25.0, 0.0, animationValue),
                height: lerpDouble(minMenuHeight, _currentHeight, animationValue),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20), bottom: Radius.circular(lerpDouble(20.0, 0.0, animationValue))),
                  ),
                  child: isExpanded ? _expandedMenu() : _collapsedMenu(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _BuildList extends StatelessWidget {
  const _BuildList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: EdgeInsets.only(bottom: index == items.length - 1 ? 50.0 : 0.0),
          child: _BuildListItem(item: item),
        );
      },
    );
  }
}

class _BuildListItem extends StatelessWidget {
  const _BuildListItem({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(image: AssetImage('assets/${item.bg}'), fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned.fill(
          top: 40,
          child: Column(
            children: [
              CircleAvatar(backgroundImage: AssetImage('assets/${item.avatar}'), radius: 25),
              Text(
                item.title,
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500, fontSize: 18),
              ),
              Text(
                item.subtitle,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 20),
              )
            ],
          ),
        )
      ],
    );
  }
}
