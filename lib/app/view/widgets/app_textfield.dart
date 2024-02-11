import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.hintText,
    required this.controller,
    required this.icon,
    this.isPassword = false,
    super.key,
  });
  final String hintText;
  final TextEditingController controller;
  final Icon icon;
  final bool isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Pole nie może być puste';
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        filled: true,
        hintText: hintText,
        prefixIcon: icon,
        prefixIconColor: Colors.grey.shade700,
        prefixIconConstraints: const BoxConstraints(
          minWidth: 60,
        ),
        hintStyle: GoogleFonts.syne(
          color: Colors.grey.shade700,
          fontWeight: FontWeight.w400,
        ),
        fillColor: Colors.grey.shade200,
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(100),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }
}
