import 'package:flutter/material.dart';

class custom_btn extends StatelessWidget {
  const custom_btn({super.key, required this.text, required this.onTap});

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          elevation: 0, minimumSize: const Size(double.infinity, 50)), // size
      child: Text(
        text,
      ),
    );
  }
}
