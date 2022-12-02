import 'package:flutter/material.dart';
import 'package:flutter_home_test/view_models/splash_screens_view_model.dart';
import 'package:get/get.dart';

import 'routes/routes_name.dart';
import 'routes/routes_pages.dart';
import 'view_models/product_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.splashScreen,
      getPages: RoutesPages.pages,
      initialBinding: BindingsBuilder(() {
        Get.put(SplashScreenViewModel());
        // Get.put(ProductViewModels());
      }),
    );
  }
}
