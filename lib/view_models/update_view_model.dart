import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateViewModels extends GetxController {
  final GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();

  late TextEditingController nameProductController = TextEditingController();
  late TextEditingController priceProductController = TextEditingController();
  late TextEditingController descriptionProductController =
      TextEditingController();
  late TextEditingController categoryProductController =
      TextEditingController();
  late TextEditingController imageProductController = TextEditingController();

  String nameProductC = '';
  String priceProductC = '';
  String descriptionProductC = '';
  String categoryProductC = '';
  String imageProductC = '';

  String? nameValidate(String value) {
    if (value.isEmpty) {
      return 'Please enter name product';
    } else {
      return null;
    }
  }

  String? priceValidate(String value) {
    if (value.isEmpty) {
      return 'Please enter price product';
    } else {
      return null;
    }
  }

  String? descriptionValidate(String value) {
    if (value.isEmpty) {
      return 'Please enter description product';
    } else {
      return null;
    }
  }

  String? categoryValidate(String value) {
    if (value.isEmpty) {
      return 'Please enter category product';
    } else {
      return null;
    }
  }

  String? imageValidate(String value) {
    if (value.isEmpty) {
      return 'Please enter image product';
    } else {
      return null;
    }
  }

  @override
  void onInit() {
    nameProductController = TextEditingController();
    priceProductController = TextEditingController();
    descriptionProductController = TextEditingController();
    categoryProductController = TextEditingController();
    imageProductController = TextEditingController();
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

  void submitUpdate(void onPressed) async {
    final isValid = updateFormKey.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      updateFormKey.currentState!.save();
      Get.back();
      return onPressed;
    }
  }
}
