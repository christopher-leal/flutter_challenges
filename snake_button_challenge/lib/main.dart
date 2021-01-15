import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _SnakeButton(
                duration: const Duration(milliseconds: 2000),
                child: Text('Hola'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SnakeButton extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Color borderColor;
  final Color snakeColor;
  final double borderWidth;
  final VoidCallback onTap;

  const _SnakeButton({
    @required this.child,
    @required this.onTap,
    this.duration,
    this.borderColor = Colors.black,
    this.snakeColor = Colors.red,
    this.borderWidth = 6.0,
  });

  @override
  __SnakeButtonState createState() => __SnakeButtonState();
}

class __SnakeButtonState extends State<_SnakeButton> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration ?? const Duration(milliseconds: 600))..repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: CustomPaint(
        painter: _SnakePainter(
          animation: _controller,
          borderColor: widget.borderColor,
          borderWidth: widget.borderWidth,
          snakeColor: widget.snakeColor,
        ),
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}

class _SnakePainter extends CustomPainter {
  final Animation animation;
  final Color borderColor;
  final Color snakeColor;
  final double borderWidth;

  _SnakePainter({this.animation, this.borderColor, this.snakeColor, this.borderWidth}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final borderPaint = Paint()
      ..color = borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = borderWidth;

    final path = Path.combine(PathOperation.xor, Path()..addRect(rect), Path()..addRect(rect.deflate(borderWidth)));
    final snakePain = Paint()
      ..shader = SweepGradient(
              colors: [snakeColor, Colors.transparent],
              stops: [0.8, 1.0],
              startAngle: 0.0,
              endAngle: vector.radians(90),
              transform: GradientRotation(vector.radians(360 * animation.value)))
          .createShader(rect);

    canvas.drawRect(rect.deflate(borderWidth / 2), borderPaint);
    canvas.drawPath(path, snakePain);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
