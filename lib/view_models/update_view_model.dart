import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateViewModels extends GetxController {
  final updateFormKey = GlobalKey<FormState>();

  final nameProductController = TextEditingController();
  final priceProductController = TextEditingController();
  final descriptionProductController = TextEditingController();
  final categoryProductController = TextEditingController();
  final imageProductController = TextEditingController();

  //validator
  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  //update product
  void updateProduct() {
    if (updateFormKey.currentState!.validate()) {
      Get.back();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    nameProductController.clear();
    priceProductController.clear();
    descriptionProductController.clear();
    categoryProductController.clear();
    imageProductController.clear();
    super.onClose();
  }

  @override
  void dispose() {
    nameProductController.dispose();
    priceProductController.dispose();
    descriptionProductController.dispose();
    categoryProductController.dispose();
    imageProductController.dispose();

    super.dispose();
  }
}