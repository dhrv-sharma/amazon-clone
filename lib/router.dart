import 'package:amazonclone/pages/auth_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings rs) {
  switch (rs.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: rs, builder: (_) => const AuthScreen());
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
