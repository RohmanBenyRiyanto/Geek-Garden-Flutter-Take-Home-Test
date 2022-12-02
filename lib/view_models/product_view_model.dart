import 'package:flutter/material.dart';
import 'package:flutter_home_test/models/product_models.dart';
import 'package:get/get.dart';

class ProductViewModels extends GetxController {
  //List product
  RxList<ProductModel> productList = <ProductModel>[].obs;
  // var iteproductListms = [].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //validator
  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  //add product
  void addProduct(
    int id,
    String name,
    String price,
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
    Get.back();
  }

  //update product
  void updateProductItem(int index, ProductModel product) {
    productList[index] = product;
    Get.back();
  }

  void deleteProductItem(int index) {
    productList.removeAt(index);
    Get.back();
  }
}
