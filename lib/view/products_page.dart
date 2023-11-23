import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/constants.dart';
import 'package:operations/view/widgets/custom_text.dart';

import 'product_list.dart';

class ProductsPage extends StatelessWidget {
  int selectedPage;

  ProductsPage({required this.selectedPage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: selectedPage,
        length: 7,
        child: Scaffold(
          // backgroundColor: Colors.black,
          body: Container(
            decoration: const BoxDecoration(
              gradient: kGradient,
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 5, top: 20),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        CustomText(
                          text: 'Popular',
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/icons/Filter.png'),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    padding: EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        TabBar(
                          labelPadding: EdgeInsets.all(20),
                          indicatorColor: Color(0xFF3B3B3B),
                          labelStyle: TextStyle(
                            color: Color(0xFF3B3B3B),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                          unselectedLabelStyle: TextStyle(
                            color: Color(0xFF888888),
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                          tabAlignment: TabAlignment.start,
                          isScrollable: true,
                          tabs: [
                            Text('Shirt'),
                            Text('Bag'),
                            Text('Vest'),
                            Text('Sneaker'),
                            Text('Trousers'),
                            Text('Hat'),
                            Text('Sandals'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              ProductList(prdouctCategory: 'shirts'),
                              ProductList(prdouctCategory: 'bag'),
                              ProductList(prdouctCategory: 'vest'),
                              ProductList(prdouctCategory: 'sneaker'),
                              ProductList(prdouctCategory: 'trousers'),
                              ProductList(prdouctCategory: 'hats'),
                              ProductList(prdouctCategory: 'sandals'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
