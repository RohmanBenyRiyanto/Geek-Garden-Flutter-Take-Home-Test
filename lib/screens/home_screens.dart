import 'package:flutter/material.dart';
import 'package:flutter_home_test/themes/color.dart';
import 'package:flutter_home_test/themes/fontstyle.dart';
import 'package:flutter_home_test/themes/margin.dart';
import 'package:flutter_home_test/themes/responsive.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            Container(
              height: 40,
              width: 40,
              padding: EdgeInsets.all(defaultHorizontal12),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(defaultRadius),
                boxShadow: defaultCardShadow,
              ),
              child: InkWell(
                hoverColor: primaryColor.withAlpha(50),
                onTap: () {},
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
                  ),
                  child: Container(
                    width: displayWidth(context),
                    height: 150,
                    // padding: EdgeInsets.only(
                    //   left: defaultHorizontal14,
                    //   top: defaultHorizontal14,
                    //   bottom: defaultHorizontal14,
                    // ),
                    margin: EdgeInsets.only(
                      left: defaultMargin,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      border: Border.fromBorderSide(
                        BorderSide(
                          width: 1.5,
                          color: greyTwoColor,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(defaultRadius),
                      boxShadow: defaultCardShadow,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 120.0,
                          height: 150.0,
                          decoration: BoxDecoration(
                            color: greyThreeColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(defaultRadius),
                              bottomLeft: Radius.circular(defaultRadius),
                            ),
                          ),
                          child: SizedBox(
                            height: 150.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(defaultRadius),
                                bottomLeft: Radius.circular(defaultRadius),
                              ),
                              child: Image.network(
                                'https://cf.shopee.co.id/file/c3f610df6ad1a92b2df242772fdb660b',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: defaultHorizontal12,
                              right: defaultHorizontal14,
                              top: defaultHorizontal14,
                              bottom: defaultHorizontal14,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost SATA III 2.5',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 16.0,
                                    fontWeight: bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: defaultVertical6,
                                ),
                                Text(
                                  'Man\'s T-Shirt',
                                  style: primaryTextStyle.copyWith(
                                    fontSize: 14.0,
                                    fontWeight: semiBold,
                                    decoration: TextDecoration.underline,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: defaultVertical6,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Rp. 100.000',
                                        style: blackTextStyle.copyWith(
                                          fontSize: 18.0,
                                          fontWeight: bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(
                                      width: defaultHorizontal6,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: defaultHorizontal12,
                                        vertical: defaultVertical6,
                                      ),
                                      decoration: BoxDecoration(
                                        color: blackColor,
                                        borderRadius: BorderRadius.circular(
                                            defaultRadius),
                                      ),
                                      child: Text(
                                        'View Details',
                                        style: whiteTextStyle.copyWith(
                                          fontSize: 14.0,
                                          fontWeight: semiBold,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
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
