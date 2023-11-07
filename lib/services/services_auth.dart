import 'package:amazonclone/const/error_handl.dart';
import 'package:amazonclone/const/global_var.dart';
import 'package:amazonclone/const/snackbar.dart';
import 'package:amazonclone/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class auth_service {
  // sign up user
  void signupuser(
      {
      // get context
      required BuildContext context,
      required String email,
      required String pasword,
      required String name}) async {
    try {
      User user = User(
          id: '',
          email: email,
          name: name,
          password: pasword,
          address: '',
          type: '');

      // sign up
      // remeber we set an api for /api/signup which gives json
      // body is set to give input to json file
      http.Response res = await http
          .post(Uri.parse('$uri/api/signup'), body: user.toJson(), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      print(res.statusCode);

      // snack bar and https error
      httpsError(
          response: res,
          context: context,
          onSucces: () {
            snackbar(context, "Account Creation Success");
          });
    } catch (e) {
      snackbar(context, e.toString());
    }
  }
}