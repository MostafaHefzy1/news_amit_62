import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconButton? suffixIcon;
  final Function? validator;
  final TextEditingController controller;
  const CustomTextFormFiled(
      {super.key,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      required this.validator,
      required this.controller});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // obscureText: true,
      validator: (String? value) {
        validator!(value);
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: hintText,
          contentPadding: const EdgeInsets.all(5),
          prefixIconColor: Colors.amber,
          suffixIconColor: Colors.amber,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          suffixIcon: suffixIcon),
    );
  }
}