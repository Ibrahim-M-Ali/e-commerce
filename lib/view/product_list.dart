// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:operations/core/view_model/home_view_model.dart';

import '../model/product_model.dart';
import 'product_details.dart';
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
      body: FutureBuilder<List<ProductModel>>(
        future: controller.getProduct(
            prdouctCategory), // Replace with your method that returns a Future
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
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
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisExtent: 290,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext ctx, index) {
                var productData = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => ProductDetails(
                            data: productData,
                          ));
                    },
                    child: ProductCard(
                      image: productData.image,
                      price: productData.price,
                      productName: productData.name,
                    ),
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
