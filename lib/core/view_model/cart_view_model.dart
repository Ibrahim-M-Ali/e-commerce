import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../model/product_model.dart';

class CartViewModel extends GetxController {
  var productsBox = Hive.box<ProductModel>('products_box');

  // ValueNotifier<bool> _loading = ValueNotifier(false);
  // ValueNotifier<bool> get loading => _loading;
  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;
  double get totalPrice => _totalPrice;
  double _totalPrice = 0.0;

  @override
  void onInit() {
    getAllProucts();
    getTotalPrice();
    super.onInit();
  }

  getAllProucts() async {
    _productList = productsBox.values.toList();

    update();
  }

  getTotalPrice() {
    for (int i = 0; i < _productList.length; i++) {
      _totalPrice += _productList[i].price! * _productList[i].quantity;
    }
    update();
  }

  void addProductToCart({required ProductModel product}) async {
    if (_productList.isEmpty) {
      await productsBox.add(product);
      update();
      getAllProucts();
      Get.snackbar('title', 'Added Succses ${productList.length}');
    } else {
      bool isProductFound = false;
      for (int i = 0; i < _productList.length; i++) {
        if (_productList[i].id == product.id) {
          Get.snackbar('title', 'Already Added ');
          isProductFound = true;
          break;
        }
      }
      if (!isProductFound) {
        productsBox.add(product);
        update();
        getAllProucts();
        Get.snackbar('title', 'Added Successfully ${productList.length}');
      }
    }
    update();
  }

  increaseQuantity(int index) {
    _productList[index].quantity++;
    _totalPrice += _productList[index].price!;
    update();
  }

  decreaseQuantity(int index) {
    _productList[index].quantity--;
    _totalPrice -= _productList[index].price!;
    update();
  }

  void removeProductFromCart(int index) async {
    double removedProductPrice =
        _productList[index].price! * _productList[index].quantity;

    _totalPrice -= removedProductPrice;

    _productList.removeAt(index);
    productsBox.deleteAt(index);
    update();
  }
}
