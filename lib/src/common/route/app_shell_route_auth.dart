import 'package:go_router/go_router.dart';
import 'package:worksheet/src/auth/ui/layout/auth_layout.dart';
import 'package:worksheet/src/auth/ui/screen/auth_screen.dart';
import 'package:worksheet/src/auth/ui/view/login_view.dart';
import 'package:worksheet/src/auth/ui/view/password_recovery_view.dart';
import 'package:worksheet/src/auth/ui/view/signup_view.dart';
import 'package:worksheet/src/auth/ui/view/update_password_view.dart';
import 'package:worksheet/src/common/route/app_route.dart';

final shellRouteAuth = ShellRoute(
  routes: [
    GoRoute(
      path: Routes.auth,
      name: Routes.auth.toNameRoute(),
      builder: (context, state) => const AuthScreen(),
      routes: [
        GoRoute(
          path: Routes.login,
          name: Routes.login.toNameRoute(),
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: Routes.signUp,
          name: Routes.signUp.toNameRoute(),
          builder: (context, state) => const SignupView(),
        ),
        GoRoute(
          path: Routes.recoverPassword,
          name: Routes.recoverPassword.toNameRoute(),
          builder: (context, state) => const PasswordRecoveryView(),
        ),
        GoRoute(
          path: Routes.updatePassword,
          name: Routes.updatePassword.toNameRoute(),
          builder: (context, state) => const UpdatePasswordView(),
        ),
      ],
    ),
  ],
  builder: (context, state, child) => AuthLayout(
    child: child,
  ),
);
