// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:operations/core/view_model/home_view_model.dart';

import 'widgets/product_card.dart';

class ProductList extends StatelessWidget {
  String prdouctCategory;

  ProductList({
    required this.prdouctCategory,
  });
  HomeViewModel controller = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: controller.getProduct(
            prdouctCategory), // Replace with your method that returns a Future
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            // Handle errors
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            // Data loaded successfully

            return GridView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisExtent: 290,
              ),
              itemCount: controller.productModel.length,
              itemBuilder: (BuildContext ctx, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: ProductCard(
                    image: controller.productModel[index]['image'],
                    price: controller.productModel[index]['price'],
                    productName: controller.productModel[index]['name'],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
