import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatefulWidget {
  const MyTextField({
    Key? key,
    required this.labelText,
    required this.icon,
    required this.keyType,
    required this.onChanged,
  }) : super(key: key);
  final String labelText;
  final IconData icon;
  final TextInputType keyType;
  final ValueChanged onChanged;

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.roboto().copyWith(fontWeight: FontWeight.w600),
      obscureText: widget.keyType == TextInputType.visiblePassword ? true : false,
      keyboardType: widget.keyType,
      cursorColor: Colors.orange,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        suffixIcon: Icon(widget.icon, color: Colors.black),
        labelText: widget.labelText,
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
