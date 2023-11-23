// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:core';

import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  int? price;
  @HiveField(2)
  String? image;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? id;
  @HiveField(5)
  late double quantity;

  ProductModel({
    this.name,
    this.price,
    this.image,
    this.description,
    this.id,
    this.quantity = 1,
  });

  ProductModel.fromJson(map) {
    name = map['name'];
    price = map['price'];
    image = map['image'];
    description = map['description'];
    id = map['id'];
  }
  toJson() {
    return {
      'name': name,
      'price': price,
      'image': image,
      'description': description,
      'id': id,
    };
  }
}
