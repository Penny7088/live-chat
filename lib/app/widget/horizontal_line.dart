import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final double width;
  final double height;
  final double strokeWidth;
  final Color lineColor;

  const HorizontalLine(
      {super.key,
      required this.lineColor,
      required this.width,
      required this.height,
      required this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height), // 设置线的宽度和高度
      painter: LinePainter(strokeWidth, lineColor),
    );
  }
}

class LinePainter extends CustomPainter {
  final double strokeWidth;
  final Color lineColor;

  LinePainter(this.strokeWidth, this.lineColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = lineColor // 设置线的颜色
      ..strokeWidth = strokeWidth; // 设置线的厚度

    canvas.drawLine(
      Offset(0, size.height / 2), // 起点
      Offset(size.width, size.height / 2), // 终点
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant LinePainter oldDelegate) {
    return oldDelegate.lineColor != lineColor;
  }
}
