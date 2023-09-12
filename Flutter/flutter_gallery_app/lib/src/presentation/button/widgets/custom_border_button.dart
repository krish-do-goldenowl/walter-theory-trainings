import 'package:flutter/material.dart';

class CustomBorderButton extends CustomClipper<Path> {
  double radius;
  CustomBorderButton({this.radius = 8});

  @override
  Path getClip(Size size) {
    var path = Path();

    path.addRRect(RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(radius),
    ));

    final clipPath = Path();
    double centerX = size.width / 4;

    clipPath
        .addOval(Rect.fromCircle(center: Offset(centerX, 0), radius: radius));

    clipPath.addOval(
        Rect.fromCircle(center: Offset(centerX, size.height), radius: radius));

    final ticketPath =
        Path.combine(PathOperation.reverseDifference, clipPath, path);

    return ticketPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
