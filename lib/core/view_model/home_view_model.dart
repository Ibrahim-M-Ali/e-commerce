// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:operations/model/shirt_model.dart';

class HomeViewModel extends GetxController {
  List productModel = [];
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  ValueNotifier<bool> get loading => _loading;
  String? prdouctCategory;

  final _productCollectionRef =
      FirebaseFirestore.instance.collection('clothes');

  // Future getProduct(prdouctCategory) async {
  //   var value = await _productCollectionRef.doc(prdouctCategory).get();

  //   Map<String, dynamic> data = value.data() as Map<String, dynamic>;
  //   productModel = data.values.toList();
  // }

  Future<Map<String, dynamic>> getProduct(prdouctCategory) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection('clothes')
        .doc(prdouctCategory)
        .get();

    if (documentSnapshot.exists) {
      // print(documentSnapshot.data() as Map<String, dynamic>);
      return documentSnapshot.data() as Map<String, dynamic>;
    } else {
      return {};
    }
  }
}
