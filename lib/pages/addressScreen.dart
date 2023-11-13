import 'package:amazonclone/const/global_var.dart';
import 'package:amazonclone/providers/userproviders.dart';
import 'package:amazonclone/widgets/button.dart';
import 'package:amazonclone/widgets/field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class addressForm extends StatefulWidget {
  const addressForm({super.key});
  static const String routeName = '/address';

  @override
  State<addressForm> createState() => _addressFormState();
}

class _addressFormState extends State<addressForm> {
  final TextEditingController flat = TextEditingController();
  final TextEditingController area = TextEditingController();
  final TextEditingController pinode = TextEditingController();
  final TextEditingController city = TextEditingController();

  final address_key = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flat.dispose();
    area.dispose();
    pinode.dispose();
    city.dispose();
  }

  void ongpayResult(res) {}

  @override
  Widget build(BuildContext context) {
    var address = context.watch<UserProvider>().user.address;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // disable the Sliver app bar back button
            backgroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios),
            ), // used to the set the back button of the screen
            pinned: true,
            automaticallyImplyLeading: true,
            toolbarHeight: 50,
            flexibleSpace: Column(
              children: [
                Container(
                  // padding: const EdgeInsets.only(top: 5),
                  height: 50,
                  decoration: const BoxDecoration(
                      gradient: GlobalVariables.appBarGradient),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Delivery Address",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  address.isNotEmpty
                      ? Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.5)),
                              ),
                              child: Text(
                                address,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              "OR",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.4),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 15,
                            )
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text(
                              "No Address Saved",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                  Form(
                      // form requires a key
                      key: address_key,
                      child: Column(
                        children: [
                          custome_field(
                            controller: flat,
                            hint: "Flat,House no,building",
                          ),
                          custome_field(controller: area, hint: "Area, Street"),
                          custome_field(
                            controller: pinode,
                            hint: "Pin Code",
                          ),
                          custome_field(
                            controller: city,
                            hint: "Town/City",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          custom_btn(
                              text: address.isEmpty
                                  ? "Set My Address"
                                  : "Confirm New Address",
                              onTap: () {
                                // here we check whole form is valid or not if yes sign up user function get runs
                                if (address_key.currentState!.validate()) {}
                              }),
                        ],
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
