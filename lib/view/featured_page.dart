import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/view/widgets/custom_text.dart';
import 'package:operations/view/widgets/product_card.dart';

import '../constants.dart';
import '../core/view_model/home_view_model.dart';
import 'products_page.dart';
import 'widgets/category_tab.dart';
import 'widgets/custom_button.dart';

class FeaturedPage extends StatelessWidget {
  HomeViewModel controller = Get.put(HomeViewModel());

//  Images OF Category
  List category = [
    [
      "Shirt",
      "assets/images/category/shirts.png",
    ],
    [
      'Bag',
      'assets/images/category/bag.png',
    ],
    [
      'Vest',
      'assets/images/category/vest.png',
    ],
    [
      'Sneaker',
      'assets/images/category/sneaker.png',
    ],
    [
      'Trousers',
      'assets/images/category/trousers.jpg',
    ],
    [
      'Hat',
      'assets/images/category/hat.jpg',
    ],
    [
      'Sandals',
      'assets/images/category/sandal.png',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Container(
              width: 360,
              height: 208,
              decoration: ShapeDecoration(
                shadows: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 10,
                    offset: Offset(5, 5),
                  )
                ],
                image: const DecorationImage(
                  image: AssetImage('assets/images/collection-shirt.png'),
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
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    height: 50,
                    // width: 680,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: category.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                            onTap: () {
                              Get.to(ProductsPage(
                                selectedPage: index,
                              ));
                            },
                            child: CategoryTab(
                              iamgePath: category[index][1],
                              categoryName: category[index][0],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Popular',
                  color: Color(0xFF3B3B3B),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                ),
                CustomText(
                  text: 'See More',
                  color: Color(0xFF888888),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: controller.getProduct(
                'popular'), // Replace with your method that returns a Future
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
                    crossAxisCount: 3,
                    crossAxisSpacing: 15.0,
                    mainAxisExtent: 290,
                  ),
                  itemCount: 6,
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
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Best Seller',
                  color: Color(0xFF3B3B3B),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                ),
                CustomText(
                  text: 'See More',
                  color: Color(0xFF888888),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 0.11,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: controller.getProduct(
                'bestSeller'), // Replace with your method that returns a Future
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
                    crossAxisCount: 3,
                    crossAxisSpacing: 15.0,
                    mainAxisExtent: 290,
                  ),
                  itemCount: 6,
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
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Recommended For You',
                  color: Color(0xFF3B3B3B),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 0.08,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 320,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (BuildContext ctx, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: ProductCard(),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ]);
  }
}
