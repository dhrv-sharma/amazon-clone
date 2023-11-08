import 'package:flutter/material.dart';

class top_button extends StatefulWidget {
  top_button({super.key, required this.name, required this.onTap});

  String name;
  Function()? onTap;

  @override
  State<top_button> createState() => _top_buttonState();
}

class _top_buttonState extends State<top_button> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.0),
            borderRadius: BorderRadius.circular(50),
            color: Colors.white),
        child: OutlinedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black12.withOpacity(0.03),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                )),
            onPressed: widget.onTap,
            child: Text(
              widget.name,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
            )),
      ),
    );
  }
}
