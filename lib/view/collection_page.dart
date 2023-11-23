import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/view/collection_products.dart';

import 'package:operations/view/widgets/collection_widget.dart';

class CollectionPage extends StatelessWidget {
  List<String> productImages = [
    'assets/images/shirt.png',
    'assets/images/white-blazer.png',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Get.to(() => CollectionProducts(
                  imageName: productImages[index],
                ));
          },
          child: CollectionWidget(
            imageName: productImages[index],
          ),
        );
      },
    );
  }
}
//  