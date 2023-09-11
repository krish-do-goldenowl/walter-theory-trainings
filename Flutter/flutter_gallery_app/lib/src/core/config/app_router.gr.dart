// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    RowColumnRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RowColumnPage(),
      );
    },
    TypographyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TypographyPage(),
      );
    },
  };
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RowColumnPage]
class RowColumnRoute extends PageRouteInfo<void> {
  const RowColumnRoute({List<PageRouteInfo>? children})
      : super(
          RowColumnRoute.name,
          initialChildren: children,
        );

  static const String name = 'RowColumnRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TypographyPage]
class TypographyRoute extends PageRouteInfo<void> {
  const TypographyRoute({List<PageRouteInfo>? children})
      : super(
          TypographyRoute.name,
          initialChildren: children,
        );

  static const String name = 'TypographyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
