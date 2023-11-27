// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/constants.dart';
import 'package:operations/core/view_model/cart_view_model.dart';
import 'package:operations/model/product_model.dart';
import 'package:operations/view/widgets/custom_button.dart';
import 'package:operations/view/widgets/custom_text.dart';

class ProductDetails extends StatelessWidget {
  var productDetails;

  ProductDetails({
    required this.productDetails,
  });
//
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 320,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: Image.network(
                      productDetails.image,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: CustomText(
                    fontSize: 20,
                    text: productDetails.name,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomText(
                  fontSize: 16,
                  text: 'Description',
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: Text(
                    productDetails.description,
                    style: TextStyle(
                        fontSize: 17, height: 1.6, color: Colors.black54),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: "PRICE",
                          ),
                          CustomText(
                            text: '\$${productDetails.price}',
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ],
                      ),
                      GetBuilder<CartViewModel>(
                        init: CartViewModel(),
                        builder: (controller) {
                          return SizedBox(
                            width: 150,
                            child: CustomButton(
                              onPressed: () {
                                controller.addProductToCart(
                                  product: ProductModel(
                                    name: productDetails.name,
                                    description: productDetails.description,
                                    image: productDetails.image,
                                    price: productDetails.price,
                                    id: productDetails.id,
                                    quantity: 1,
                                  ),
                                );
                              },
                              text: 'Add',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
