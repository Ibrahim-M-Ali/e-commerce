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

  CartViewModel() {
    getAllProducts();
    getTotalPrice();
  }

  getAllProducts() async {
    _productList = productsBox.values.toList();
    update();
  }

  getTotalPrice() {
    _totalPrice = _productList.fold(0.0, (total, product) {
      return total + product.price! * product.quantity;
    });
    _totalPrice = double.parse(_totalPrice.toStringAsFixed(2));
    update();
  }

  void addProductToCart({required ProductModel product}) async {
    if (_productList
        .any((existingProduct) => existingProduct.name == product.name)) {
      Get.snackbar('title', 'Already Added');
    } else {
      productsBox.add(product);
      update();
      getAllProducts();
      Get.snackbar('title', 'Added Successfully ${productList.length}');
    }
    update();
  }

  increaseQuantity(int index) {
    _productList[index].quantity++;
    getTotalPrice(); // Update total price when quantity changes
    update();
  }

  decreaseQuantity(int index) {
    if (_productList[index].quantity > 1) {
      _productList[index].quantity--;
      getTotalPrice(); // Update total price when quantity changes
      update();
    } else {
      // removeProductFromCart(index);
    }
  }

  void removeProductFromCart(int index) {
    double removedProductPrice =
        _productList[index].price! * _productList[index].quantity;

    _totalPrice -= removedProductPrice;
    _totalPrice = double.parse(_totalPrice.toStringAsFixed(2));
    _productList.removeAt(index);
    productsBox.deleteAt(index);
    update();
  }
}
