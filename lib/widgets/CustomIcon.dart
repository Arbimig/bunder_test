import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomIcon extends StatelessWidget {
  final double dx;
  final double dy;
  final List<Color> colors;
  CustomIcon({this.dx, this.dy, this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        painter: CustomIconDiamond(colors: colors),
        size: Size(dx, dy),
      ),
    );
  }
}

class CustomIconDiamond extends CustomPainter {
  final List<Color> colors;
  CustomIconDiamond({this.colors});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..shader = RadialGradient(
        colors: colors,
      ).createShader(Rect.fromCircle(
        center: Offset(0, size.height),
        radius: size.height * 1.5,
      ));

    Path path = Path()
      ..lineTo(0, size.height / 2)
      ..cubicTo(size.width * 0.29, size.height * 0.38, size.width * 0.38,
          size.height * 0.29, size.width / 2, 0)
      ..cubicTo(size.width * 0.62, size.height * 0.29, size.width * 0.71,
          size.height * 0.38, size.width, size.height / 2)
      ..cubicTo(size.width * 0.71, size.height * 0.62, size.width * 0.62,
          size.height * 0.71, size.width / 2, size.height)
      ..cubicTo(size.width * 0.38, size.height * 0.71, size.width * 0.29,
          size.height * 0.62, 0, size.height / 2)
      ..cubicTo(0, size.height / 2, 0, size.height / 2, 0, size.height / 2);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CustomCircleIcon extends CustomPainter {
  List<Color> colors;
  CustomCircleIcon({this.colors});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.height * 0.09
      ..shader = RadialGradient(
        colors: colors,
      ).createShader(Rect.fromCircle(
        center: Offset(0, size.height),
        radius: size.height * 1.5,
      ));
    

    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.height / 2, size.width / 2),
        height: size.height,
        width: size.width,
      ),
      2 * pi,
      3 * pi / 2,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
