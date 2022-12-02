import 'package:flutter/material.dart';

import '../../themes/color.dart';
import '../../themes/fontstyle.dart';
import '../../themes/margin.dart';
import '../../themes/responsive.dart';
import '../buttons/button_small.dart';

class CardOurProduct extends StatelessWidget {
  CardOurProduct({
    Key? key,
    required this.name,
    required this.price,
    required this.category,
    required this.description,
    required this.images,
  }) : super(key: key);

  final String name;
  final String price;
  final String category;
  final String description;
  final String images;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getOrientation(context) == 0
          ? displayWidth(context) * 0.5
          : displayWidth(context) - 48,
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
                  images,
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
                    name,
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
                    category,
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
                          price,
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
                        tittle: 'Edit Product',
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
