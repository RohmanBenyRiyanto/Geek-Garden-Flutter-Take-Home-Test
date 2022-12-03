import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/color.dart';
import '../../utils/fontstyle.dart';
import '../../utils/margin.dart';
import '../../utils/responsive.dart';

class CardOurProductEmpty extends StatelessWidget {
  const CardOurProductEmpty({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) - 48,
      height: 150,
      padding: EdgeInsets.only(
        left: defaultHorizontal14,
        top: defaultHorizontal14,
        bottom: defaultHorizontal14,
      ),
      margin: EdgeInsets.only(
        left: defaultHorizontal16,
      ),
      decoration: BoxDecoration(
        gradient: primaryGradient,
        borderRadius: BorderRadius.circular(defaultRadius),
        boxShadow: defaultCardShadow,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Oops your product is empty',
                  style: whiteTextStyle.copyWith(
                    fontSize: 16.0,
                    fontWeight: semiBold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: defaultVertical6,
                ),
                Text(
                  'Add your product now, get better sales worldwide.',
                  style: subtitleTextStyle.copyWith(
                    fontSize: 12.0,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ),
          LottieBuilder.network(
            'https://lottie.host/7cbb17d8-4a7e-42ab-849f-7f4bf0d773fe/93DK7mFzAW.json',
          ),
        ],
      ),
    );
  }
}
