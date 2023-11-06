import 'package:amazonclone/const/global_var.dart';
import 'package:flutter/material.dart';

void snackbar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.black87,
      content: Text(
        text,
        style: const TextStyle(color: GlobalVariables.secondaryColor),
      )));
}
