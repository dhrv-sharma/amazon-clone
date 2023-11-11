import 'package:amazonclone/model/product.dart';
import 'package:amazonclone/pages/add_product_Screen.dart';
import 'package:amazonclone/pages/auth_screen.dart';
import 'package:amazonclone/pages/category_deals.dart';
import 'package:amazonclone/pages/home.dart';
import 'package:amazonclone/pages/productdetails.dart';
import 'package:amazonclone/pages/searched_product.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings rs) {
  switch (rs.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: rs, builder: (_) => const AuthScreen());

    case home.routeName:
      return MaterialPageRoute(settings: rs, builder: (_) => const home());

    case add_product_screen.routeName:
      return MaterialPageRoute(
          settings: rs, builder: (_) => const add_product_screen());

    case CategoryScreen.routeName:
      var category = rs.arguments
          as String; // argument which will be given to the CategoryScreen()
      return MaterialPageRoute(
          settings: rs, builder: (_) => CategoryScreen(category: category));

    case SearchedScreen.routeName:
      var searchQuery = rs.arguments
          as String; // argument which will be given to the SearchScreen()
      return MaterialPageRoute(
          settings: rs,
          builder: (_) => SearchedScreen(searchquery: searchQuery));
    case ProductDetailScreen.routeName:
      var product = rs.arguments
          as Product; // argument which will be given to the SearchScreen()
      return MaterialPageRoute(
          settings: rs, builder: (_) => ProductDetailScreen(product: product));
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
