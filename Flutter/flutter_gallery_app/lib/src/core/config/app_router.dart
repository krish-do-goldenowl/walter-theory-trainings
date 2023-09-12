import 'package:auto_route/auto_route.dart';
import 'package:flutter_gallery_app/src/presentation/bottom_app_bar/screen/bottom_app_bar_page.dart';
import 'package:flutter_gallery_app/src/presentation/container/screen/container_page.dart';
import 'package:flutter_gallery_app/src/presentation/custom_box_shape/screen/custom_box_shape_page.dart';
import 'package:flutter_gallery_app/src/presentation/home/screen/home_page.dart';
import 'package:flutter_gallery_app/src/presentation/row_column/screen/row_column_page.dart';
import 'package:flutter_gallery_app/src/presentation/stack/screen/stack_page.dart';
import 'package:flutter_gallery_app/src/presentation/typography/screen/typography_page.dart';
import 'package:flutter_gallery_app/src/presentation/wrap/screen/wrap_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(path: '/typography', page: TypographyRoute.page),
        AutoRoute(path: '/rowColumn', page: RowColumnRoute.page),
        AutoRoute(path: '/stack', page: StackRoute.page),
        AutoRoute(path: '/container', page: ContainerRoute.page),
        AutoRoute(path: '/customBoxShape', page: CustomBoxShapeRoute.page),
        AutoRoute(path: '/bottomAppBar', page: BottomAppBarRoute.page),
        AutoRoute(path: '/wrap', page: WrapRoute.page)
      ];
}
