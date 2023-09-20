import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gallery_app/src/core/constants/list_gallery_item.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My widget"),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_rounded),
            onPressed: () {},
          )
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 16),
          itemCount: galleryItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              isThreeLine: true,
              leading: Icon(galleryItems[index].icon),
              title: Text(
                galleryItems[index].title,
                style: const TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                galleryItems[index].subTitle,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: () {
                context.router.pushNamed(galleryItems[index].router);
              },
              dense: true,
            );
          },
          separatorBuilder: (context, index) => const Divider(indent: 70),
        ),
      ),
    );
  }
}
