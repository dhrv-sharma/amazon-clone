import 'package:amazonclone/const/global_var.dart';
import 'package:amazonclone/pages/auth_screen.dart';
import 'package:amazonclone/router.dart';
import 'package:flutter/material.dart';

//  in this project we created a const folder having const data like colors

void main() {
  runApp(MaterialApp(
    onGenerateRoute: ((settings) =>
        generateRoute(settings)), // create route when call pushnamed function
    theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme:
            // sets the primary color of every widget is golden
            const ColorScheme.light(primary: GlobalVariables.secondaryColor),
        appBarTheme: const AppBarTheme(
            // for whole project this app bar settings get applied to app bar
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black))),
    title: "Amazon",
    home: const AuthScreen(),
  ));
}
