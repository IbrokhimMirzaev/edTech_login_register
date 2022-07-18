import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    Key? key,
    required this.labelText,
    required this.icon,
    required this.keyType,
    required this.controller,
  }) : super(key: key);
  final String labelText;
  final IconData icon;
  final TextInputType keyType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.roboto().copyWith(fontWeight: FontWeight.w600),
      obscureText: keyType == TextInputType.visiblePassword ? true : false,
      keyboardType: keyType,
      cursorColor: Colors.orange,
      controller: controller,
      // onChanged kerakmasmi
      //yuq

      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        suffixIcon: Icon(icon, color: Colors.black),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black45,
          fontWeight: FontWeight.w400,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.orange,
            width: 3,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
