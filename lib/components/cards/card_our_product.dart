import 'package:flutter/material.dart';

import '../../themes/color.dart';
import '../../themes/fontstyle.dart';
import '../../themes/margin.dart';
import '../../themes/responsive.dart';
import '../buttons/button_small.dart';

class CardOurProduct extends StatelessWidget {
  const CardOurProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) - 48,
      height: 150,
      margin: EdgeInsets.only(
        left: defaultHorizontal16,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        border: Border.fromBorderSide(
          BorderSide(
            width: 1.5,
            color: greyOneColor,
          ),
        ),
        borderRadius: BorderRadius.circular(
          defaultRadius,
        ),
        boxShadow: defaultCardShadow,
      ),
      child: Row(
        children: [
          Container(
            width: 110.0,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      ButtonSmall(
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
