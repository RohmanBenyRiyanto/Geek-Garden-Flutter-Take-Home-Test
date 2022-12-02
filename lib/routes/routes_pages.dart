import 'package:flutter_home_test/routes/routes_binding.dart';
import 'package:get/get.dart';

import '../screens/detail_product_screens.dart';
import '../screens/home_screens.dart';
import '../screens/splash_screens.dart';
import '../screens/update_product_screens.dart';

import 'routes_name.dart';

class RoutesPages {
  static final pages = [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RoutesName.homeScreen,
      page: () => HomeScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.detailProduct,
      page: () => const DetailProductScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: RoutesName.updateProduct,
      page: () => UpdateProductScreens(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: UpdateBinding(),
    ),
  ];
}
