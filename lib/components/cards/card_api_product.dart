import 'package:flutter/material.dart';

import '../../themes/color.dart';
import '../../themes/fontstyle.dart';
import '../../themes/margin.dart';

class CardApiProduct extends StatelessWidget {
  const CardApiProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: defaultMargin,
      ),
      child: GridView.count(
        childAspectRatio: 0.7,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: List.generate(
          10,
          (index) {
            return Container(
              padding: EdgeInsets.all(defaultHorizontal8),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(defaultRadius),
                boxShadow: defaultCardShadow,
                border: Border.fromBorderSide(
                  BorderSide(
                    color: greyOneColor,
                    width: 1.5,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.favorite_border_rounded,
                        size: 24,
                        color: greyOneColor,
                      ),
                      Icon(
                        Icons.shopping_cart_checkout_rounded,
                        size: 24,
                        color: greyOneColor,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Center(
                      child: Image.network(
                        'https://cf.shopee.co.id/file/c3f610df6ad1a92b2df242772fdb660b',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: defaultHorizontal8,
                  ),
                  Text(
                    'Product Name',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: defaultVertical4 - 2,
                  ),
                  Text(
                    'lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet',
                    style: subtitleTwoTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: regular,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: defaultVertical4 - 2,
                  ),
                  Text(
                    'Rp. 100.000',
                    style: blackTextStyle.copyWith(
                        fontSize: 18, fontWeight: bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
