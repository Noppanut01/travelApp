import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelName;
  final String hintText;
  final bool obs;
  const MyTextField({
    super.key,
    required this.controller,
    required this.labelName,
    required this.hintText,
    required this.obs,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obs,
      decoration: InputDecoration(
        label: Text(labelName),
        hintText: hintText,
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 42),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade600,
          ),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.blue.shade600,
          ),
          gapPadding: 10,
        ),
      ),
    );
  }
}
