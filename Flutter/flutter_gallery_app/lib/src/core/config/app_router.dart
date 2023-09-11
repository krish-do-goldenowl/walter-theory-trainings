import 'package:auto_route/auto_route.dart';
import 'package:flutter_gallery_app/src/presentation/container/screen/container_page.dart';
import 'package:flutter_gallery_app/src/presentation/home/screen/home_page.dart';
import 'package:flutter_gallery_app/src/presentation/row_column/screen/row_column_page.dart';
import 'package:flutter_gallery_app/src/presentation/stack/screen/stack_page.dart';
import 'package:flutter_gallery_app/src/presentation/text_field/screen/text_field_page.dart';
import 'package:flutter_gallery_app/src/presentation/typography/screen/typography_page.dart';

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
        AutoRoute(path: '/textField', page: TextFieldRoute.page)
      ];
}
