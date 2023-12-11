class ProductModel {
  String? name;
  double? price;
  String? image;
  String? size;
  String? description;

  ProductModel({
    this.name,
    this.price,
    this.image,
    this.size,
    this.description,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    image = json['image'];
    size = json['size'];
    description = json['description'];
  }
}
