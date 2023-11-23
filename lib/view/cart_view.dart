import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants.dart';
import '../core/view_model/cart_view_model.dart';
import 'widgets/custom_button.dart';
import 'widgets/custom_text.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const CustomText(
          fontWeight: FontWeight.w500,
          fontSize: 25,
          text: 'My Cart',
        ),
      ),
      body: Column(
        children: [
          GetBuilder<CartViewModel>(
            init: CartViewModel(),
            builder: (controller) => Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: ListView.separated(
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Container(
                        height: 1,
                        width: 100,
                        color: Colors.grey[200],
                      ),
                    );
                  },
                  itemCount: controller.productList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 135,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    controller.productList[index].image!),
                              ),
                            ),
                            height: 135,
                            width: 125,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 150,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 40,
                                        child: CustomText(
                                          fontSize: 16,
                                          text: controller
                                              .productList[index].name!,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller
                                              .removeProductFromCart(index);
                                          print(index);
                                        },
                                        child: Container(
                                          child: const Icon(Icons.close),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                CustomText(
                                  fontSize: 15,
                                  color: primaryColor,
                                  text:
                                      '\$ ${controller.productList[index].price}',
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5)),
                                    color: Colors.grey[200],
                                  ),
                                  width: 140,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          controller.increaseQuantity(index);
                                        },
                                        child: const Icon(
                                          Icons.add,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      CustomText(
                                        fontSize: 20,
                                        text:
                                            '${controller.productList[index].quantity.toInt()}',
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.decreaseQuantity(index);
                                        },
                                        child: Container(
                                          padding:
                                              const EdgeInsets.only(bottom: 15),
                                          child: const Icon(
                                            Icons.minimize,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          GetBuilder<CartViewModel>(
            builder: (priceController) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const CustomText(
                        text: 'TOTAL',
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        color: primaryColor,
                        text: '\$ ${priceController.totalPrice}',
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Container(
                    width: 150,
                    child: const CustomButton(
                      text: 'CHECKOUT',
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
