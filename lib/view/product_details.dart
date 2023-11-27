// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operations/view/widgets/review_widget.dart';

import '../constants.dart';
import 'widgets/custom_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetails extends StatefulWidget {
  final data;
  ProductDetails({required this.data});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List<Color> productColors = [
    const Color(0xFFE74C3C),
    const Color(0xFF2ECC71),
    const Color(0xFFFEA628),
    const Color(0xFF523E53),
    const Color(0xFF0084FF),
    Colors.white
  ];
  // Add your available sizes
  Color? selectedColor;
  List<String> productSizes = ['S', 'M', 'L', 'XL']; // Add your available sizes
  String? selectedSize;
  List<bool> isExpandedList = [false];
  bool isExpanded = false;

  void _toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: kGradient,
          ),
          child: Column(
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
                      SizedBox(
                        width: 250,
                        child: CustomText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          text: widget.data['name'],
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
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
                  padding: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 250,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(widget.data['image']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: CustomText(
                            text: widget.data['name'],
                            color: const Color(0xFF3B3B3B),
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CustomText(
                            text: '\$${widget.data['price'].toString()}',
                            color: const Color(0xFF3B3B3B),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CustomText(
                            color: const Color(0xFF3B3B3B),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            text: widget.data['description'],
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: CustomText(
                            fontSize: 16,
                            color: Color(0xFF3B3B3B),
                            fontWeight: FontWeight.w600,
                            text: 'Select Size',
                          ),
                        ),
                        SizedBox(
                          width: 360,
                          height: 46,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: productSizes.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedSize =
                                          selectedSize == productSizes[index]
                                              ? null
                                              : productSizes[index];
                                    });
                                  },
                                  child: Container(
                                    width: 46,
                                    height: 46,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                          width: 1.5,
                                          color: selectedSize ==
                                                  productSizes[index]
                                              ? Colors.black
                                              : const Color(0xFFC4C4C4),
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                    child: Center(
                                      child:
                                          CustomText(text: productSizes[index]),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: CustomText(
                            fontSize: 16,
                            color: Color(0xFF3B3B3B),
                            fontWeight: FontWeight.w600,
                            text: 'Select Color',
                          ),
                        ),
                        SizedBox(
                          width: 360,
                          height: 46,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: productColors.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedColor =
                                          selectedColor == productColors[index]
                                              ? null
                                              : productColors[index];
                                    });
                                  },
                                  child: Container(
                                    width: 46,
                                    height: 46,
                                    decoration: BoxDecoration(
                                      color: productColors[index],
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50)),
                                    ),
                                    child: selectedColor == productColors[index]
                                        ? const Icon(
                                            Icons.check,
                                            color: Colors.white,
                                          )
                                        : null,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: 1,
                            width: double.infinity,
                            color: const Color(0xFF888888),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: _toggleExpansion,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CustomText(
                                      color: Color(0xFF3B3B3B),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      text: 'Review (3)',
                                    ),
                                    const Spacer(),
                                    RatingBarIndicator(
                                      rating: 2.75,
                                      itemBuilder: (context, index) =>
                                          const Icon(
                                        Icons.star,
                                        color: Color(0xFF3B3B3B),
                                      ),
                                      itemCount: 5,
                                      itemSize: 20,
                                      direction: Axis.horizontal,
                                    ),
                                    Icon(
                                      isExpanded
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      size: 30,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                height: isExpanded ? 300.0 : 0.0,
                                child: ReviewWidget(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//
//This code provides a detailed view of a product, including its image, name, price, description, size selection, color selection, and review section. The code also includes proper