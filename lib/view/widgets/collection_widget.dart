import 'package:flutter/material.dart';

import 'package:operations/constants.dart';

import 'package:operations/view/widgets/custom_button.dart';

import 'package:operations/view/widgets/custom_text.dart';

class CollectionWidget extends StatelessWidget {
  CollectionWidget({required this.imageName});

  String? imageName;

  // padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 0),

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 21, left: 21, right: 21, top: 0),
      child: Container(
        width: 350,
        height: 360,
        decoration: ShapeDecoration(
          image: DecorationImage(
            image: AssetImage(imageName!),
            fit: BoxFit.fitWidth,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          gradient: kGradientCollection,
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                width: 150,
                height: 60,
                child: CustomButton(
                  fontWeight: FontWeight.w600,
                  height: 0.10,
                  text: 'Shop',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
