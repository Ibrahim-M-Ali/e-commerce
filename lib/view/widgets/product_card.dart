// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:operations/view/widgets/custom_text.dart';

class ProductCard extends StatelessWidget {
  String? image;
  String? productName;
  double? price;
  ProductCard({
    this.image =
        "https://eg.hm.com/assets/styles/HNM/16739363/cc6023ae6590a0b6c455db9958afe7d7e9d76b42/2/image-thumb__4922072__product_zoom_medium_606x504/1bd3ad86196642097f7f76bda3a8c422e0200e96.jpg",
    this.productName = 'Big Blazer',
    this.price = 178,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 173,
          height: 215,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(image!),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    // print("H");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    height: 40,
                    width: 40,
                    child: Image.asset('assets/images/icons/bag-product.png'),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8,
        ),
        CustomText(
          maxLines: 1,
          textAlign: TextAlign.center,
          text: productName!,
          color: Color(0xFF3B3B3B),
          fontWeight: FontWeight.w400,
        ),
        CustomText(
          textAlign: TextAlign.center,
          text: '\$$price',
          color: Color(0xFF3B3B3B),
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
