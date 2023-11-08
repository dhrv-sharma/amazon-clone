import 'package:amazonclone/const/global_var.dart';
import 'package:amazonclone/providers/userproviders.dart';
import 'package:amazonclone/widgets/order.dart';
import 'package:amazonclone/widgets/top_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  // temporary list
  List list = [
    {
      "image": "images/laptop.jpg",
      "name": "HP ZBook Firefly 40.6 cm (16) G9 Mobile Workstation PC",
      "price": "500",
      "status": "Dispatched"
    },
    {
      "image": "images/laptop.jpg",
      "name": "HP ZBook Firefly 40.6 cm (16) G9 Mobile Workstation PC",
      "price": "500",
      "status": "Delivered"
    },
    {
      "image": "images/laptop.jpg",
      "name": "HP ZBook Firefly 40.6 cm (16) G9 Mobile Workstation PC",
      "price": "500",
      "status": "Refunded"
    },
    {
      "image": "images/laptop.jpg",
      "name": "HP ZBook Firefly 40.6 cm (16) G9 Mobile Workstation PC",
      "price": "500",
      "status": "Cancelled"
    },
    {
      "image": "images/laptop.jpg",
      "name": "HP ZBook Firefly 40.6 cm (16) G9 Mobile Workstation PC",
      "price": "500",
      "status": "Delivered"
    },
    {
      "image": "images/laptop.jpg",
      "name": "HP ZBook Firefly 40.6 cm (16) G9 Mobile Workstation PC",
      "price": "500",
      "status": "Refunded"
    },
  ];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
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
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(5, 8, 3, 2),
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          "images/amazon_in.png",
                          width: 120,
                          height: 45,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.notifications_outlined,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: RichText(
                        text: TextSpan(
                            text: 'Hello, ',
                            style: const TextStyle(
                                fontSize: 22, color: Colors.black),
                            children: [
                          TextSpan(
                              text: user.name,
                              style: const TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))
                        ])),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    top_button(name: "Your Orders", onTap: () {}),
                    top_button(name: "Turn Seller", onTap: () {})
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    top_button(name: "Log out", onTap: () {}),
                    top_button(name: "Your Wishlist", onTap: () {})
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(
                        "Your Orders",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        "See all",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: GlobalVariables.selectedNavBarColor),
                      ),
                    ),
                  ],
                ),

                // list view builder to display our products orders
                Container(
                  height: 300,
                  padding: const EdgeInsets.only(left: 10, top: 20, right: 0),
                  child: ListView.builder(
                      itemCount: list.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return order_product(
                          src: list[index]['image'],
                          name: list[index]['name'],
                          status: list[index]['status'],
                        );
                      })),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
