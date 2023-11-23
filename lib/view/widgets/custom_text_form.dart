// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../constants.dart';

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
      width: 400,
      height: 80,
      child: TextFormField(
        obscureText: obscureText,
        onSaved: onSaved,
        validator: validator,
        cursorHeight: 20,
        cursorColor: kLightBlack,
        // controller: controller,
        decoration: InputDecoration(
          suffixIcon: icon,
          filled: true,
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: const TextStyle(
            fontSize: 14,
            color: Color(0xFFC4C4C4),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kLightBlack, width: 1),
          ),
        ),
      ),
      // child: TextFormField(
      //   obscureText: obscureText,
      //   onSaved: onSaved,
      //   validator: validator,
      //   cursorColor: const Color(0xFFC5CCD6),
      //   decoration: InputDecoration(
      //       suffixIcon: icon,
      //       disabledBorder: UnderlineInputBorder(
      //           borderSide: BorderSide(color: Colors.black),
      //           borderRadius: BorderRadius.all(Radius.circular(10))),
      //       focusedBorder: const UnderlineInputBorder(
      //         borderSide: BorderSide(color: Colors.black),
      //       ),
      //       enabledBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: Color(0xFFE1E3E8))),
      //       // labelText: 'Email',
      //       label: Text(
      //         labelText,
      //         style: const TextStyle(color: Color(0xFFC5CCD6)),
      //       )),
      // ),
    );
  }
}
