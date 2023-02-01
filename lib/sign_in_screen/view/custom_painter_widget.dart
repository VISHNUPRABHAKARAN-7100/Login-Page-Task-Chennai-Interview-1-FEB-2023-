import 'package:flutter/cupertino.dart';
import '../../utils/constant_colors.dart';

// This widget is used to create the shape of appbar.

class CustomPainterWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color =  ConstantColors.redColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(size.width * 0.0025000, size.height * 0.0091324);
    path.lineTo(0, size.height * 0.6103501);
    path.quadraticBezierTo(
      size.width * 0.0909250,
      size.height * 0.7720244,
      size.width * 0.2271125,
      size.height * 0.7047641,
    );
    path.quadraticBezierTo(
      size.width * 1.0061750,
      size.height * 0.3640335,
      size.width,
      size.height * 0.3668798,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
