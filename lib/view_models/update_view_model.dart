import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateViewModels extends GetxController with StateMixin<List<String>> {
  final GlobalKey<FormState> updateFormKey = GlobalKey<FormState>();

  late TextEditingController nameProductController;
  late TextEditingController priceProductController;
  late TextEditingController descriptionProductController;
  late TextEditingController categoryProductController;

  String nameProductC = '';
  String priceProductC = '';
  String descriptionProductC = '';
  String categoryProductC = '';

  @override
  void onInit() {
    nameProductController = TextEditingController();
    priceProductController = TextEditingController();
    descriptionProductController = TextEditingController();
    categoryProductController = TextEditingController();
    super.onInit();
  }


  @override
  void onClose() {
    nameProductController.dispose();
    priceProductController.dispose();
    descriptionProductController.dispose();
    categoryProductController.dispose();

    super.onClose();
  }

  String? validator(String value) {
    if (value.isEmpty) {
      return 'Please this field must be filled';
    }
    return null;
  }

  void submitUpdate(void onPressed) async {
    final isValid = updateFormKey.currentState!.validate();
    if (!isValid) {
      return null;
    } else {
      updateFormKey.currentState!.save();
      Get.back();
      return onPressed;
    }
  }
}
