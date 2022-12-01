import 'package:flutter/material.dart';
import 'package:flutter_home_test/routes/routes_name.dart';
import 'package:flutter_home_test/themes/color.dart';
import 'package:flutter_home_test/themes/fontstyle.dart';
import 'package:flutter_home_test/themes/margin.dart';
import 'package:flutter_home_test/themes/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../components/buttons/button_small.dart';
import '../components/cards/card_api_product.dart';
import '../components/cards/card_our_product.dart';
import '../components/cards/card_our_product_empty.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildHeader() {
      return Container(
        padding: EdgeInsets.all(
          defaultMargin,
        ),
        width: displayWidth(context),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    'Discover our exclusive products',
                    style: blackTextStyle.copyWith(
                      fontSize: 24.0,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    height: defaultVertical6,
                  ),
                  Text(
                    'In this online store you can buy and sell your products easily.',
                    style: subtitleTwoTextStyle.copyWith(
                      fontSize: 14.0,
                      fontWeight: regular,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: defaultHorizontal12,
            ),
            InkWell(
              onTap: () {
                Get.toNamed(RoutesName.updateProduct);
              },
              child: Container(
                height: 40,
                width: 40,
                padding: EdgeInsets.all(defaultHorizontal12),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(defaultRadius),
                  boxShadow: defaultCardShadow,
                ),
                child: SvgPicture.asset(
                  'assets/svg/ic_add.svg',
                  fit: BoxFit.scaleDown,
                  color: blackColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

    //Carousel horizontal
    Widget _buildOurProduct() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultHorizontal24,
            ),
            child: Text(
              'Our Product',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: bold,
              ),
            ),
          ),
          SizedBox(
            height: defaultVertical12,
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.only(
                    right: index == 4 ? defaultMargin : 0.0,
                    left: index == 0 ? defaultHorizontal8 : 0.0,
                  ),
                  child: CardOurProduct(),
                );
              },
            ),
          ),
        ],
      );
    }

    Widget _buildFakeStoreApiProduct() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: defaultHorizontal16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: defaultHorizontal24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fake Store Api Product',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  'Limit 10',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: medium,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: defaultVertical12,
          ),
          CardApiProduct(),
          SizedBox(
            height: defaultHorizontal24,
          ),
        ],
      );
    }

    Widget _buildContent() {
      return ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          _buildHeader(),
          _buildOurProduct(),
          _buildFakeStoreApiProduct(),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: _buildContent(),
      ),
    );
  }
}
