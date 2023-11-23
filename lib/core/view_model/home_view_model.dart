// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  List productModel = [];
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  String? prdouctCategory;

  Future getProduct(prdouctCategory) async {
    final _productCollectionRef = FirebaseFirestore.instance
        .collection('clothes')
        .doc(prdouctCategory)
        .get();

    try {
      var value = await _productCollectionRef;

      Map<String, dynamic> data = value.data() as Map<String, dynamic>;

      productModel = data.values.toList();

      update();
    } catch (error) {
      print('Error fetching products: $error');
      return {};
    }
  }

  // getBestSeelingProduct() async {
  //   _loading.value = true;
  //   getBestSellingProducts().then(
  //     (value) {
  //       for (int i = 0; i < value; i++) {
  //         _productModel.add(ProductModel.fromJson(value[i].data()));
  //       }
  //       _loading.value = false;
  //       update();
  //     },
  //   );
  // }
}
