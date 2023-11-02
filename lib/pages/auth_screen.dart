import 'package:amazonclone/const/global_var.dart';
import 'package:amazonclone/widgets/button.dart';
import 'package:amazonclone/widgets/field.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName =
      '/auth-screen'; // will pass to the main function
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signUpFormkey = GlobalKey<FormState>();
  final _signInFormkey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void dispose() {
      super.dispose();
      email.dispose();
      username.dispose();
      pass.dispose();
    }

    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 5,
            ),
            ListTile(
              tileColor: _auth == Auth.signup
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Create Account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                groupValue: _auth,
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signup,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            _auth == Auth.signup
                ? Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.all(8),
                    child: Form(
                        key: _signUpFormkey,
                        child: Column(
                          children: [
                            custome_field(
                              controller: email,
                              hint: "Email",
                            ),
                            custome_field(
                                controller: username, hint: "Username"),
                            custome_field(
                              controller: pass,
                              hint: "Password",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            custom_btn(text: "Sign up", onTap: () {})
                          ],
                        )),
                  )
                : Container(),
            ListTile(
              tileColor: _auth == Auth.signin
                  ? GlobalVariables.backgroundColor
                  : GlobalVariables.greyBackgroundCOlor,
              title: const Text(
                "Sign in",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Radio(
                groupValue: _auth,
                activeColor: GlobalVariables.secondaryColor,
                value: Auth.signin,
                onChanged: (Auth? val) {
                  setState(() {
                    _auth = val!;
                  });
                },
              ),
            ),
            _auth == Auth.signin
                ? Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.all(8),
                    child: Form(
                        key: _signUpFormkey,
                        child: Column(
                          children: [
                            custome_field(
                              controller: email,
                              hint: "Email",
                            ),
                            custome_field(
                              controller: pass,
                              hint: "Password",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            custom_btn(text: "Sign In", onTap: () {})
                          ],
                        )),
                  )
                : Container(),
          ],
        ),
      )),
    );
  }
}
