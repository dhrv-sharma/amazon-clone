import 'package:amazonclone/const/global_var.dart';
import 'package:flutter/material.dart';

class home_actual_page extends StatefulWidget {
  const home_actual_page({super.key});

  @override
  State<home_actual_page> createState() => _home_actual_pageState();
}

class _home_actual_pageState extends State<home_actual_page> {
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(40),
          child: AppBar(
            flexibleSpace: Container(
              // flexible space is used to give gradient color
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.068,
                decoration: const BoxDecoration(
                    gradient: GlobalVariables.appBarGradient),
                child: Row(children: [
                  Container(
                    // when you use text form field you have to give a parent widget to set the dimension of the text field
                    padding: const EdgeInsets.fromLTRB(24, 10, 6, 12),
                    width: 350, // setting the dimension of the
                    height: 60,
                    child: Material(
                      borderRadius: BorderRadius.circular(
                          10), // to show some elevation it is done
                      elevation: 1,
                      child: TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  left: 0,
                                ),
                                child: Icon(
                                  Icons.qr_code_scanner,
                                  color: Colors.black54,
                                  size: 23,
                                ),
                              )),
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(
                                left: 0,
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors
                              .white, // field backgorund color set to white
                          contentPadding: const EdgeInsets.only(
                              top: 10), // padding to content
                          border: const OutlineInputBorder(
                            // when field is active
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            // when field is  actived
                            borderRadius: const BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide(
                              color: GlobalVariables.selectedNavBarColor,
                              width: 1,
                            ),
                          ),

                          enabledBorder: const OutlineInputBorder(
                            // when field is not active
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),

                          hintText: 'Search Amazon.in',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 9,
                    ),
                    child: Icon(
                      Icons.mic_rounded,
                      color: Colors.black,
                      size: 25,
                    ),
                  )
                ]),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.82,
                color: Colors.black,
                child: Container(),
              )
            ],
          ),
        ));
  }
}
