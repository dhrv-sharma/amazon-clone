// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:amazonclone/const/error_handl.dart';
import 'package:amazonclone/const/global_var.dart';
import 'package:amazonclone/const/snackbar.dart';
import 'package:amazonclone/model/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductDetailsServices {
  void rateProduct(
      {required BuildContext context,
      required Product product,
      required double rating,
      required user}) async {
    try {
      http.Response res = await http.post(
          Uri.parse(
              '$uri/api/rate-product'), // by $category the qyery will be done from database
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          },
          body:
              jsonEncode({'id': product.id, 'rating': rating, 'userId': user}));
      httpsError(
          response: res,
          context: context,
          onSucces: () {
            snackbar(context, "Thank Your for Rating");
          });
    } catch (e) {
      snackbar(context, e.toString());
    }
  }
}
