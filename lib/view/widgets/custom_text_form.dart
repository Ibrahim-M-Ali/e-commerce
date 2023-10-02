// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  final String labelText;
  final bool obscureText;
  final IconButton? icon;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  const CustomTextFormFiled({
    required this.labelText,
    this.obscureText = false,
    this.icon,
    this.onSaved,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 400,
      height: 80,
      child: TextFormField(
        obscureText: obscureText,
        onSaved: onSaved,
        validator: validator,
        cursorColor: const Color(0xFFC5CCD6),
        decoration: InputDecoration(
            suffixIcon: icon,
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFE1E3E8))),
            // labelText: 'Email',
            label: Text(
              labelText,
              style: const TextStyle(color: Color(0xFFC5CCD6)),
            )),
      ),
    );
  }
}
