import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/fontstyle.dart';
import '../../utils/margin.dart';

class ButtonSmall extends StatelessWidget {
   ButtonSmall({
    Key? key,
    this.tittle,
    required this.onPressed,
  }) : super(key: key);

  String? tittle;

  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blackColor,
        borderRadius: BorderRadius.circular(defaultRadius),
      ),
      child: TextButton(
          onPressed: onPressed as void Function()?,
          style: TextButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: defaultHorizontal12,
                vertical: defaultVertical6,
              ),
              minimumSize: Size(50, 30),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment: Alignment.centerLeft),
          child: Text(
            tittle ?? 'Button',
            style: whiteTextStyle.copyWith(
              fontSize: 12.0,
              fontWeight: medium,
            ),
          )),
    );
  }
}
