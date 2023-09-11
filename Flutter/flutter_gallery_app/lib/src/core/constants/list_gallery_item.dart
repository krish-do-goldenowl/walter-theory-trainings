import 'package:flutter/material.dart';
import 'package:flutter_gallery_app/src/data/models/gallery_item.dart';

final List<GalleryItem> galleryItems = [
  GalleryItem(
    icon: Icons.phone_iphone_rounded,
    title: 'Cupertino',
    subTitle:
        'Beautiful and high-fidelity widgets for current iOS design language',
    router: '/',
  ),
  GalleryItem(
    icon: Icons.text_fields_rounded,
    title: 'Typography',
    subTitle: 'All of the predefined text styles',
    router: '/typography',
  ),
  GalleryItem(
    icon: Icons.menu_rounded,
    title: 'Bottom app bar',
    subTitle: 'Bottom application bar',
    router: '/',
  ),
  GalleryItem(
    icon: Icons.web_outlined,
    title: 'Button',
    subTitle:
        'RaisedButton, FlatButton, DropdownButton, FloatingActionButton, IconButton, InkWell, RawMaterialButton, etc',
    router: '/',
  ),
  GalleryItem(
    icon: Icons.format_list_bulleted_rounded,
    title: 'List',
    subTitle: 'Scrolling list layout',
    router: '/',
  ),
  GalleryItem(
    icon: Icons.chrome_reader_mode_rounded,
    title: 'Card',
    subTitle: 'Cards with rounded corners and decoration',
    router: '/container',
  ),
  GalleryItem(
    icon: Icons.tab_unselected_rounded,
    title: 'Alert',
    subTitle: 'Alerts, SnackBar & Tooltip',
    router: '/',
  ),
  GalleryItem(
    icon: Icons.dehaze_rounded,
    title: 'Text Field',
    subTitle: 'Text Field, Text Field Form',
    router: '/',
  ),
  GalleryItem(
    icon: Icons.graphic_eq_rounded,
    title: 'Row & Column',
    subTitle:
        'A widget that displays its children in a horizontal and vertical array',
    router: '/rowColumn',
  ),
  GalleryItem(
    icon: Icons.edit_attributes_rounded,
    title: 'Wrap & Chip',
    subTitle: 'Wrap & Chip',
    router: '/',
  ),
  GalleryItem(
    icon: Icons.copy_outlined,
    title: 'Stack & Align',
    subTitle:
        'BA widget that positions its children relative to the edges of its box',
    router: '/',
  ),
  GalleryItem(
    icon: Icons.auto_awesome_outlined,
    title: 'Custom shape',
    subTitle: 'A ticket widget with custom shape',
    router: '/',
  ),
];
