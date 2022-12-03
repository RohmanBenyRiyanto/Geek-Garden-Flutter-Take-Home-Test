import 'package:get/get.dart';

import '../view_models/pick_file_view_model.dart';
import '../view_models/product_api_view_model.dart';
import '../view_models/product_view_model.dart';
import '../view_models/splash_screens_view_model.dart';
import '../view_models/update_view_model.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenViewModel());
  }
}

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductViewModels());
    Get.lazyPut(() => ProductApiViewModel());
  }
}

class UpdateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateViewModels());
    Get.lazyPut(() => PickFileViewModel());
  }
}
