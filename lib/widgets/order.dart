import 'package:amazonclone/const/global_var.dart';
import 'package:flutter/material.dart';

class order_product extends StatefulWidget {
  order_product(
      {super.key, required this.src, required this.name, required this.status});

  String src;
  String name;
  String status;

  @override
  State<order_product> createState() => _order_productState();
}

class _order_productState extends State<order_product> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DecoratedBox(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 1.5),
            borderRadius: BorderRadius.circular(5),
            color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 160,
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                widget.src,
                fit: BoxFit.fitHeight,
                width: 180,
              ),
            ),
            Expanded(
              child: Container(
                width: 180,
                padding: const EdgeInsets.only(left: 10, right: 10, top: 2),
                child: Text(
                  widget.name,
                  maxLines: 3,
                  style: const TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10),
              child: Text(
                widget.status,
                style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: 180,
              decoration: const BoxDecoration(
                  border: BorderDirectional(
                      top: BorderSide(color: Colors.black12, width: 1.5))),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 7, top: 3, left: 45),
                child: Text(
                  "View Order",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: GlobalVariables.selectedNavBarColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
