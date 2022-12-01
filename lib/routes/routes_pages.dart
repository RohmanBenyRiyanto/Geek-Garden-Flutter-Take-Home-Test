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
    ),
    GetPage(
      name: RoutesName.homeScreen,
      page: () => const HomeScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name: RoutesName.detailProduct,
      page: () => const DetailProductScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name: RoutesName.updateProduct,
      page: () => const UpdateProductScreens(),
      transition: Transition.fade,
    ),
  ];
}
