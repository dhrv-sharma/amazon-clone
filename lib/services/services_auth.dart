import 'package:amazonclone/const/error_handl.dart';
import 'package:amazonclone/const/global_var.dart';
import 'package:amazonclone/const/snackbar.dart';
import 'package:amazonclone/model/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class auth_service {
  // sign up user
  void signupuser(
      {required BuildContext context,
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
      http.Response res = await http
          .post(Uri.parse('$uri/api/signup'), body: user.toJson(), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      });
      print(res.statusCode);
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
