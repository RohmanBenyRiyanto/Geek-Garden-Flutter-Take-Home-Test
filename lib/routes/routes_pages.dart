import 'package:get/get.dart';

import '../screens/home_screens.dart';
import '../screens/splash_screens.dart';
import '../screens/update_product_screens.dart';

import 'routes_binding.dart';
import 'routes_name.dart';

class RoutesPages {
  static final pages = [
    GetPage(
      name: RoutesName.splashScreen,
      page: () => SplashScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutesName.homeScreen,
      page: () => const HomeScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.updateProduct,
      page: () => const UpdateProductScreens(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      binding: UpdateBinding(),
    ),
  ];
}
