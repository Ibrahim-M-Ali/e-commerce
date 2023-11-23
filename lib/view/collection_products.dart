import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/view/widgets/custom_text.dart';

import '../constants.dart';
import 'collection_page.dart';
import 'widgets/product_card.dart';

class CollectionProducts extends StatelessWidget {
  String imageName;
  CollectionProducts({required this.imageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 500,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(imageName),
                      // fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(),
                    gradient: kGradientCollection,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Get.back(result: CollectionPage());
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                          size: 24,
                        )),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            CustomText(
              text: "NEW RELEASES",
              color: Color(0xFF3B3B3B),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductCard(),
                  ProductCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
