import 'package:amazonclone/pages/auth_screen.dart';
import 'package:amazonclone/pages/home.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings rs) {
  switch (rs.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: rs, builder: (_) => const AuthScreen());

    case home.routeName:
      return MaterialPageRoute(settings: rs, builder: (_) => const home());
    default:
      return MaterialPageRoute(
          settings: rs,
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('Screen does not exhist '),
                ),
              ));
  }
}
