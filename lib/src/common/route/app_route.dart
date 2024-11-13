import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class Routes{
  static String home = '/';
  static String auth = '/auth';
  static String login = '/login';
  static String recoverPassword = '/recover-password';
  static String updatePassword = '/update-password';
  static String signUp ='/sign-up';


  static String loginF = "$auth$login";
}

class AppRoute{

  static void go(BuildContext context, String route) {
    context.go(route);
  }

  static void byName(BuildContext context, String routeName, {Map<String, String> params = const {}}) {
    context.goNamed(routeName, pathParameters: params);
  }
}



extension ClenSlash on String{
  String toNameRoute()=> replaceAll("/", "");
}