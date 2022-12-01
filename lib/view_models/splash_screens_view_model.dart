import 'package:get/get.dart';

import '../routes/routes_name.dart';

class SplashScreenViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(RoutesName.homeScreen);
    });
  }
}
