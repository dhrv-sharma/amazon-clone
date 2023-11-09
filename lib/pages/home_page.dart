import 'package:amazonclone/const/global_var.dart';
import 'package:amazonclone/providers/userproviders.dart';

import 'package:amazonclone/widgets/scrollhome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home_actual_page extends StatefulWidget {
  const home_actual_page({super.key});

  @override
  State<home_actual_page> createState() => _home_actual_pageState();
}

class _home_actual_pageState extends State<home_actual_page> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    TextEditingController search = TextEditingController();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 60, // Set the height of the search bar
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(24, 10, 6, 12),
                    width: 350,
                    height: 60,
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 1,
                      child: TextFormField(
                        decoration: InputDecoration(
                          suffixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Icon(
                                Icons.qr_code_scanner,
                                color: Colors.black54,
                                size: 23,
                              ),
                            ),
                          ),
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(left: 0),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(7),
                            ),
                            borderSide: BorderSide(
                              color: GlobalVariables.selectedNavBarColor,
                              width: 1,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
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
                    padding: EdgeInsets.symmetric(horizontal: 9),
                    child: Icon(
                      Icons.mic_rounded,
                      color: Colors.black,
                      size: 25,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 40,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromARGB(255, 114, 226, 221),
                Color.fromARGB(255, 162, 236, 233),
              ], stops: [
                0.5,
                1.0
              ])),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 20,
                      color: Colors.black,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'Delivery to ${user.name}- ${user.address}',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 5,
                        top: 2,
                      ),
                      child: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: Colors.black,
                        size: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // scrollable part of the image
          const SliverToBoxAdapter(
            child: customeScroll(),
          ),
        ],
      ),
    );
  }
}
