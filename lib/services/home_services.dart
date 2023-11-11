// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:amazonclone/const/error_handl.dart';
import 'package:amazonclone/const/global_var.dart';
import 'package:amazonclone/const/snackbar.dart';
import 'package:amazonclone/model/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class home_back_services {
  Future<List<Product>> fetchCategoryProducts(
      {required BuildContext context, required String category}) async {
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse(
            '$uri/api/cat-product?category=$category'), // by $category the qyery will be done from database
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
      );
      httpsError(
          response: res,
          context: context,
          onSucces: () {
            // we will get list products
            // json decode convert it into list format
            List temp = jsonDecode(res.body);
            temp.forEach((element) {
              productList.add(Product.fromJson(jsonEncode(element)));
            });
          });
    } catch (e) {
      snackbar(context, e.toString());
    }
    return productList;
  }
}
