import 'package:flutter_home_test/models/product_models.dart';
import 'package:flutter_home_test/utils/color.dart';
import 'package:get/get.dart';

class ProductViewModels extends GetxController
    with StateMixin<List<ProductModel?>> {
  var productList = List<ProductModel>.empty(growable: true).obs;

  Future<void> addProduct(ProductModel product) async {
    change([], status: RxStatus.loading());
    Get.back();
    try {
      productList.add(product);

      change(productList, status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.error(e.toString()));
    }
  }

  void updateProductItem(int index, ProductModel product) {
    productList[index] = product;
    productList.refresh();
    Get.back();
  }

  void deleteProductItem(int index) {
    productList.removeAt(index);
    productList.refresh();
    Get.back();
  }

  void showSnackBar(String tittle, String message) {
    Get.snackbar(tittle, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: blackColor,
        colorText: whiteColor);
  }
}
