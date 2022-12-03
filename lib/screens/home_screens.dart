import 'package:flutter/material.dart';
import 'package:flutter_home_test/components/cards/card_our_product_empty.dart';
import 'package:flutter_home_test/routes/routes_name.dart';

import 'package:flutter_home_test/view_models/product_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../components/cards/card_api_product.dart';
import '../components/cards/card_our_product.dart';
import '../utils/color.dart';
import '../utils/fontstyle.dart';
import '../utils/margin.dart';
import '../utils/responsive.dart';
import '../view_models/product_api_view_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductViewModels>();
    final productApiController = Get.find<ProductApiViewModel>();

    Widget _buildHeader() {
      return Container(
        padding: EdgeInsets.all(
          defaultMargin,
        ),
        width: displayWidth(context),
        child: Row(
          crossAxisAlignment: getOrientation(context) == 0
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: getOrientation(context) == 0
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
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
                Get.toNamed(
                  RoutesName.updateProduct,
                  arguments: {
                    'isAdd': true,
                  },
                );
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
            child: Obx(() => productController.productList.isEmpty
                ? const CardOurProductEmpty()
                : ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: productController.productList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right:
                              index == productController.productList.length - 1
                                  ? defaultHorizontal24
                                  : 0,
                          left: index == 0 ? defaultHorizontal8 : 0.0,
                        ),
                        child: CardOurProduct(
                          id: productController.productList[index].id,
                          name: productController.productList[index].title,
                          price: productController.productList[index].price
                              .toString(),
                          category:
                              productController.productList[index].category,
                          description:
                              productController.productList[index].description,
                          images: productController.productList[index].image,
                          onPressed: () {
                            Get.toNamed(
                              RoutesName.updateProduct,
                              arguments: {
                                'isAdd': false,
                                'product': productController.productList[index],
                                'index': index,
                              },
                            );
                          },
                        ),
                      );
                    },
                  )),
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
          GetX<ProductApiViewModel>(
            init: ProductApiViewModel(),
            initState: (_) {
              productApiController.getProductApi();
            },
            builder: (_) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultMargin,
                ),
                child: GridView.count(
                  childAspectRatio: 0.7,
                  crossAxisCount: getOrientation(context) == 0 ? 4 : 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  children: List.generate(
                    productApiController.productApiList.length,
                    (index) {
                      return CardApiProduct(
                        // id: productApiController.productApiList[index].id.to,
                        name: productApiController.productApiList[index].title
                            .toString(),
                        price: productApiController.productApiList[index].price
                            .toString(),
                        category: productApiController
                            .productApiList[index].category
                            .toString(),
                        description: productApiController
                            .productApiList[index].description
                            .toString(),
                        images: productApiController.productApiList[index].image
                            .toString(),
                      );
                    },
                  ),
                ),
              );
            },
          ),
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
