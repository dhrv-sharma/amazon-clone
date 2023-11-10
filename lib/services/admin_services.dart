import 'dart:convert';
import 'dart:io';

import 'package:amazonclone/const/error_handl.dart';
import 'package:amazonclone/const/global_var.dart';
import 'package:amazonclone/const/snackbar.dart';
import 'package:amazonclone/model/product.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class adminServices {
  void sellproduct(
      {required BuildContext context, // to show errors
      required String name,
      required String description,
      required double price,
      required double quantity,
      required String category,
      required List<File> images}) async {
    try {
      final cloudinary = CloudinaryPublic("dap69mong",
          "rwdctipx"); // it creates a cloud link to store iamges at cloudinary
      List<String> imageUrl = [];
      for (var i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
            CloudinaryFile.fromFile(images[i].path,
                folder:
                    name)); // uploading file in the folder of the product name for amnagement purspose
        imageUrl.add(res.secureUrl); // link to upload at mongo db
      }

// a product object is created
      Product product = Product(
          name: name,
          description: description,
          quantity: quantity,
          images: imageUrl,
          category: category,
          price: price);

      http.Response res = await http.post(Uri.parse('$uri/admin/add-product'),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8'
          },
          body: product.toJson());

      httpsError(
          response: res,
          context: context,
          onSucces: () {
            snackbar(context, "Product Added Successfully");
            Navigator.pop(context);
          });

      // post api server
    } catch (e) {
      Navigator.pop(context);

      snackbar(context, e.toString());
    }
  }

// function to get admin products
  Future<List<Product>> fetchAllproduct(BuildContext context) async {
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
        Uri.parse('$uri/admin/get-product'),
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
      );
// .fromJson acept only the string so first res.body gives the raw which we decode so we get map list then we used index to access particular item and then that item get encodeed to string
      // ignore: use_build_context_synchronously
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
      // ignore: use_build_context_synchronously
      snackbar(context, e.toString());
    }
    return productList;
  }
}
