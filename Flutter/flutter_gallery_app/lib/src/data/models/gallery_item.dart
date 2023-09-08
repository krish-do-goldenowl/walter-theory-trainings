import 'package:flutter/material.dart';

class GalleryItem {
  final IconData icon;
  final String title;
  final String subTitle;
  final String router;

  GalleryItem({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.router,
  });
}
