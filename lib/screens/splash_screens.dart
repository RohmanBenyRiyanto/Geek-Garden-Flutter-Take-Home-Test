import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/color.dart';
import '../utils/fontstyle.dart';
import '../utils/margin.dart';
import '../utils/responsive.dart';
import '../view_models/splash_screens_view_model.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final splashController = Get.find<SplashScreenViewModel>();
  @override
  Widget build(BuildContext context) {
    Widget _buildContentPotrait() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: displayWidth(context) * 0.5,
            ),
            SizedBox(
              height: defaultVertical16,
            ),
            Text(
              'Splash Screen',
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildContentLandscape() {
      return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(
              size: displayHeight(context) * 0.5,
            ),
            SizedBox(
              height: defaultVertical16,
            ),
            Text(
              'Splash Screen',
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      );
    }

    //handling orientation
    return Scaffold(
      backgroundColor: primaryColor,
      body: getOrientation(context) == 0
          ? _buildContentLandscape()
          : _buildContentPotrait(),
    );
  }
}
