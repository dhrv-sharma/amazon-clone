import 'package:flutter/material.dart';

class custome_field extends StatelessWidget {
  const custome_field(
      {super.key, required this.controller, required this.hint});

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black38)),
          enabledBorder: const OutlineInputBorder(
              // set color of the field when not focused
              borderSide: BorderSide(color: Colors.black38)),
        ),
        validator: (val) {},
      ),
    );
  }
}
