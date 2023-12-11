import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/core/view_model/cart_view_model.dart';
import '../constants.dart';
import 'widgets/custom_text.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: kGradient,
        ),
        child: GetBuilder<CartViewModel>(
          init: CartViewModel(),
          builder: (controller) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 5, top: 20),
                  child: SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        const CustomText(
                          text: 'Cart',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                              'assets/images/icons/search-normal.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.productList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 117,
                                height: 145,
                                decoration: ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        controller.productList[index].image!),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 160,
                                    child: CustomText(
                                      maxLines: 1,
                                      text: controller.productList[index].name!,
                                      color: const Color(0xFF3B3B3B),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  CustomText(
                                    text:
                                        'Size: ${controller.productList[index].size}',
                                    color: const Color(0xFF888888),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    text:
                                        '\$${controller.productList[index].price}',
                                    color: const Color(0xFF3B3B3B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  const SizedBox(
                                    height: 14,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 40,
                                        decoration: ShapeDecoration(
                                          color: const Color(0xFFF6F6F6),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                controller
                                                    .decreaseQuantity(index);
                                              },
                                              icon: const Icon(Icons.remove),
                                            ),
                                            CustomText(
                                              text:
                                                  '${controller.productList[index].quantity.toInt()}',
                                              color: Color(0xFF3B3B3B),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                controller
                                                    .increaseQuantity(index);
                                              },
                                              icon: const Icon(Icons.add),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          controller
                                              .removeProductFromCart(index);
                                        },
                                        icon: const Icon(Icons.delete),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              text: 'Total',
                              color: Color(0xFF3B3B3B),
                              fontSize: 16,
                            ),
                            CustomText(
                              text: '\$${controller.totalPrice.toString()}',
                              color: Color(0xFF3B3B3B),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: double.infinity,
                          height: 45,
                          decoration: ShapeDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment(1.00, 0.00),
                              end: Alignment(-1, 0),
                              colors: [Color(0xFF5B5B5D), Color(0xFF232526)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Center(
                            child: CustomText(
                              text: 'Checkout',
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
//  Column(
//         children: [
//           GetBuilder<CartViewModel>(
//             init: CartViewModel(),
//             builder: (controller) => Expanded(
//               child: Container(
//                 padding: const EdgeInsets.all(15),
//                 child: ListView.separated(
//                   separatorBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 20),
//                       child: Container(
//                         height: 1,
//                         width: 100,
//                         color: Colors.grey[200],
//                       ),
//                     );
//                   },
//                   itemCount: controller.productList.length,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       height: 135,
//                       child: Row(
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(5),
//                               image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: NetworkImage(
//                                     controller.productList[index].image!),
//                               ),
//                             ),
//                             height: 135,
//                             width: 125,
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 20),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Container(
//                                   width: 150,
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Container(
//                                         width: 100,
//                                         height: 40,
//                                         child: CustomText(
//                                           fontSize: 16,
//                                           text: controller
//                                               .productList[index].name!,
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         width: 10,
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           controller
//                                               .removeProductFromCart(index);
//                                           print(index);
//                                         },
//                                         child: Container(
//                                           child: const Icon(Icons.close),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 5,
//                                 ),
//                                 CustomText(
//                                   fontSize: 15,
//                                   color: primaryColor,
//                                   text:
//                                       '\$ ${controller.productList[index].price}',
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 Container(
//                                   decoration: BoxDecoration(
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(5)),
//                                     color: Colors.grey[200],
//                                   ),
//                                   width: 140,
//                                   height: 40,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       InkWell(
//                                         onTap: () {
//                                           controller.increaseQuantity(index);
//                                         },
//                                         child: const Icon(
//                                           Icons.add,
//                                         ),
//                                       ),
//                                       const SizedBox(
//                                         width: 15,
//                                       ),
//                                       CustomText(
//                                         fontSize: 20,
//                                         text:
//                                             '${controller.productList[index].quantity.toInt()}',
//                                       ),
//                                       const SizedBox(
//                                         width: 15,
//                                       ),
//                                       InkWell(
//                                         onTap: () {
//                                           controller.decreaseQuantity(index);
//                                         },
//                                         child: Container(
//                                           padding:
//                                               const EdgeInsets.only(bottom: 15),
//                                           child: const Icon(
//                                             Icons.minimize,
//                                             color: Colors.black,
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ),
//           GetBuilder<CartViewModel>(
//             builder: (priceController) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Column(
//                     children: [
//                       const CustomText(
//                         text: 'TOTAL',
//                       ),
//                       const SizedBox(
//                         height: 5,
//                       ),
//                       CustomText(
//                         color: primaryColor,
//                         text: '\$ ${priceController.totalPrice}',
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     width: 100,
//                   ),
//                   Container(
//                     width: 150,
//                     child: const CustomButton(
//                       text: 'CHECKOUT',
//                     ),
//                   ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),