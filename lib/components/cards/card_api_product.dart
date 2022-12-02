import 'package:flutter/material.dart';

import '../../themes/color.dart';
import '../../themes/fontstyle.dart';
import '../../themes/margin.dart';
import '../../themes/responsive.dart';

class CardApiProduct extends StatelessWidget {
  const CardApiProduct({
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
                images,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: defaultHorizontal8,
          ),
          Text(
            name,
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
            description,
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
            '\$ $price',
            style: blackTextStyle.copyWith(fontSize: 18, fontWeight: bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
