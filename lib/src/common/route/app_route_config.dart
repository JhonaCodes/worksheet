import 'package:go_router/go_router.dart';
import 'package:worksheet/src/common/route/app_route.dart';
import 'package:worksheet/src/common/route/app_shell_route_app.dart';
import 'package:worksheet/src/common/route/app_shell_route_auth.dart';

final appRouteConfig = GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
    redirect: (context, state) {

      const isLoggedIn = false;//AuthViewModel.isLoggedIn;

      final isInAuthFlow = state.matchedLocation.startsWith(Routes.login);


     // if (!isLoggedIn && !isInAuthFlow) return Routes.loginF;


      ///if (isLoggedIn && isInAuthFlow) return '/dashboard';

      return null;
    },
  routes: [
    shellRouteAuth,
    shellRouteApp
  ]
);