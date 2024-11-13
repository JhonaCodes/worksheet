import 'package:go_router/go_router.dart';
import 'package:worksheet/src/common/ui/layout/main_layout.dart';
import 'package:worksheet/src/logbook/ui/screen/home_screen.dart';

import 'package:worksheet/src/common/route/app_route.dart';

final shellRouteApp = ShellRoute(
  routes: [
    GoRoute(
      path: Routes.home,
      name: 'home',
      builder: (context, state) => const HomeScreen(),
    ),
  ],
  builder: (context, state, child) => MainLayout(child: child,),
);