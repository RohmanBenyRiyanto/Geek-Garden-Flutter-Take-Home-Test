//binding
import 'package:flutter_home_test/view_models/product_view_model.dart';
import 'package:get/get.dart';

import '../view_models/update_view_model.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductViewModels());
  }
}

class UpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateViewModels());
  }
}