class CloudProductModel {
  String? name;
  double? price;
  String? image;
  String? description;
  double? rating;

  CloudProductModel(
      {this.name, this.price, this.image, this.description, this.rating});

  CloudProductModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['image'] = this.image;
    data['description'] = this.description;
    data['rating'] = this.rating;
    return data;
  }
}
