import 'package:amazonclone/const/global_var.dart';
import 'package:amazonclone/model/product.dart';
import 'package:amazonclone/pages/add_product_Screen.dart';
import 'package:amazonclone/services/admin_services.dart';
import 'package:amazonclone/widgets/admin_order.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final adminServices serv = adminServices();

// other method to to tackle with the future builder
  List<Product> product_list = [];

  bool isLoading = true;

  void getAllProducts() async {
    product_list = await serv.fetchAllproduct(context);
    isLoading = false;

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          flexibleSpace: Container(
            // flexible space is used to give gradient color
            decoration:
                const BoxDecoration(gradient: GlobalVariables.appBarGradient),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            toolbarHeight: 50,
            flexibleSpace: Column(
              children: [
                Container(
                  // padding: const EdgeInsets.only(top: 5),
                  height: 50,
                  decoration: const BoxDecoration(
                      gradient: GlobalVariables.appBarGradient),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 6),
                        child: Image.asset(
                          "images/amazon_in.png",
                          width: 120,
                          height: 45,
                          color: Colors.black,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          'Admin',
                          style: TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: isLoading
                ? Container(
                    height: 180,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: GlobalVariables.selectedNavBarColor,
                      ),
                    ),
                  )
                : product_list.isEmpty
                    ? Opacity(
                        opacity: 0.4,
                        child: Container(
                          height: 650,
                          child: Center(
                              child: Image.asset(
                            "images/amazon_in.png",
                            width: 270,
                            color: Colors.black,
                            fit: BoxFit.fitWidth,
                          )),
                        ),
                      )
                    : GridView.builder(
                        physics:
                            NeverScrollableScrollPhysics(), // otherwise it will not scroll
                        scrollDirection: Axis.vertical,
                        itemCount: product_list.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          // how many products in rows side thing
                          crossAxisCount: 2, mainAxisExtent: 320,
                        ),
                        itemBuilder: (context, index) {
                          return admin_product(
                              src: product_list[index].images[0],
                              name: product_list[index].name,
                              price: product_list[index].price.toString(),
                              quantity:
                                  product_list[index].quantity.toString());
                        }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, add_product_screen.routeName);
        },
        elevation: 0,
        tooltip: 'Add a product', // gives a message on long tap
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
