import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/routes_name.dart';
import 'routes/routes_pages.dart';

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
    );
  }
}
