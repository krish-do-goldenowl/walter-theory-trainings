import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/cupertino/bloc/cupertino_bloc.dart';
import 'package:flutter_gallery_app/src/presentation/cupertino/widgets/cupertino_widget.dart';

@RoutePage()
class CupertinoPage extends StatelessWidget {
  const CupertinoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CupertinoBloc>(
      create: (context) => CupertinoBloc(),
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: const CupertinoThemeData(),
        home: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings),
                label: "Widget",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.collections),
                label: "Modal",
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.news),
                label: "Form",
              ),
            ],
            onTap: (value) {},
            currentIndex: 0,
          ),
          tabBuilder: (context, index) => const CupertinoWidget(),
        ),
      ),
    );
  }
}
