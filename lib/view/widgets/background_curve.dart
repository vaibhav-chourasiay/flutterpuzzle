import 'package:flutter/cupertino.dart';

class BackgroundCurve extends CustomPainter {
  Color color;
  BackgroundCurve({required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5.0;
    Paint paint1 = Paint();
    paint1.color = color.withOpacity(0.3);
    paint1.style = PaintingStyle.fill;
    paint1.strokeWidth = 5.0;

    Path path = Path();
    // path.lineTo(330, 330);
    path.lineTo(0, size.height * 0.30);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.20,
        size.width * 0.20, size.height * 0.40);
    path.quadraticBezierTo(size.width * 0.30, size.height * 0.60,
        size.width * 0.40, size.height * 0.50);
    path.quadraticBezierTo(size.width * 0.60, size.height * 0.30,
        size.width * 0.70, size.height * 0.40);
    path.quadraticBezierTo(
        size.width * 0.90, size.height * 0.60, size.width, size.height * 0.30);
    // path.quadraticBezierTo(
    //     size.width * 0.70, size.height * 0.90, size.width, 0);
    path.lineTo(size.width, 0);
    path.close();

    Path path1 = Path();
    // path1.lineTo(330, 330);
    path1.lineTo(0, size.height * 0.40);
    path1.quadraticBezierTo(size.width * 0.10, size.height * 0.30,
        size.width * 0.20, size.height * 0.50);
    path1.quadraticBezierTo(size.width * 0.30, size.height * 0.70,
        size.width * 0.40, size.height * 0.60);
    path1.quadraticBezierTo(size.width * 0.60, size.height * 0.40,
        size.width * 0.70, size.height * 0.50);
    path1.quadraticBezierTo(
        size.width * 0.90, size.height * 0.70, size.width, size.height * 0.40);
    // path1.quadraticBezierTo(
    //     size.width * 0.70, size.height * 0.90, size.width, 0);
    path1.lineTo(size.width, 0);
    path1.close();
    canvas.drawPath(path1, paint1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
