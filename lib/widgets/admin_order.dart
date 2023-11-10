import 'package:amazonclone/const/global_var.dart';
import 'package:flutter/material.dart';

class admin_product extends StatefulWidget {
  admin_product(
      {super.key,
      required this.src,
      required this.name,
      required this.price,
      required this.quantity});

  String src;
  String name;
  String price;
  String quantity;

  @override
  State<admin_product> createState() => _admin_productState();
}

class _admin_productState extends State<admin_product> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(
                color: GlobalVariables.selectedNavBarColor.withOpacity(0.3),
                width: 1.5),
            borderRadius: BorderRadius.circular(10),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.src,
                  width: MediaQuery.of(context).size.width * 0.50,
                  height: 130,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                widget.name,
                style: const TextStyle(fontSize: 18),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0, left: 10),
              child: Text(
                "\$${widget.price}",
                style: TextStyle(
                    fontSize: 18,
                    color: GlobalVariables.selectedNavBarColor,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5, left: 10),
                  child: widget.quantity == "0"
                      ? const Text(
                          "Stock Empty",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.w500),
                        )
                      : Text(
                          "Available ${widget.quantity.split(".")[0]}",
                          style: const TextStyle(
                              fontSize: 18,
                              color: Colors.green,
                              fontWeight: FontWeight.w500),
                        ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 5, right: 10),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 18,
                  ),
                )
              ],
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.50,
                decoration: const BoxDecoration(
                    border: BorderDirectional(
                        top: BorderSide(color: Colors.black12, width: 1.5))),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 7, top: 3, left: 45),
                  child: Text(
                    "View Product",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: GlobalVariables.selectedNavBarColor),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
