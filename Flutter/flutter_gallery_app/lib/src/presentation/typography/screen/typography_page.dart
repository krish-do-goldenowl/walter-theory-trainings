import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_app/src/presentation/typography/widgets/google_text.dart';
import 'package:flutter_gallery_app/src/presentation/typography/widgets/number_text.dart';
import 'package:flutter_gallery_app/src/presentation/typography/widgets/ordinal_number_text.dart';
import 'package:flutter_gallery_app/src/presentation/typography/widgets/text_widget.dart';

@RoutePage()
class TypographyPage extends StatelessWidget {
  const TypographyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rich Text View"),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextWidget(),
          OrdinalNumberText(),
          NumberText(),
          GoogleText(),
        ],
      ),
    );
  }
}
