import 'dart:io'; // to pick images

import 'package:amazonclone/const/global_var.dart';
import 'package:flutter/material.dart';

void snackbar(BuildContext context, String text) {
  // for above dialoge use alert dialoge
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black87,
      content: Text(
        text,
        style: const TextStyle(color: GlobalVariables.secondaryColor),
      )));
}

// to pikc images from gallery
pickImages() async {
  List<File> images = [];

  try {} catch (e) {}
}
