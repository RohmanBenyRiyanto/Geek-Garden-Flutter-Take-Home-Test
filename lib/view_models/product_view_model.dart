import 'package:flutter/material.dart';
import 'package:flutter_home_test/models/product_models.dart';
import 'package:get/get.dart';

class ProductViewModels extends GetxController {
  RxList<ProductModel> productList = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void addProduct(
    int id,
    String name,
    double price,
    String description,
    String category,
    String image,
  ) {
    productList.add(
      ProductModel(
        id: id,
        title: name,
        price: price,
        description: description,
        category: category,
        image: image,
      ),
    );
  }

  void updateProductItem(int index, ProductModel product) {
    productList[index] = product;
    Get.back();
  }

  void deleteProductItem(int index) {
    productList.removeAt(index);
    productList.refresh();
    Get.back();
  }
}
