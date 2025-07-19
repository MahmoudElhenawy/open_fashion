import 'package:flutter/material.dart';

class CustomAddressTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const CustomAddressTextField({
    super.key,
    required this.label,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (v) {
        if (v == null || v.trim().isEmpty) {
          return "Please fill the field";
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(
          fontFamily: "TenorSans",
          color: Colors.grey.shade700,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
