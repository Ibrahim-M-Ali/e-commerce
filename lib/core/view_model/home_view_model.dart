// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';

class HomeViewModel extends GetxController {
  List productModel = [];
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  String? prdouctCategory;

  final _productCollectionRef =
      FirebaseFirestore.instance.collection('clothes');

  Future<List<ProductModel>> getProduct(prdouctCategory) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('clothes')
        .doc(prdouctCategory)
        .get();

    if (documentSnapshot.exists) {
      List<ProductModel> productList = [];

      // Assuming the data in Firestore is a Map<String, dynamic>
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;

      // Loop through the data and convert it to CloudProductModel instances
      data.forEach((key, value) {
        ProductModel product = ProductModel.fromJson(value);
        productList.add(product);
      });

      return productList;
    } else {
      return [];
    }
  }
}
