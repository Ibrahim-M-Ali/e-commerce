// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:operations/view/widgets/custom_text.dart';

class CustomSignButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final IconData icon;
  const CustomSignButton({
    this.onTap,
    required this.text,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 280,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FaIcon(
                icon,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              CustomText(
                color: Color(0xFF848484),
                text: text,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
