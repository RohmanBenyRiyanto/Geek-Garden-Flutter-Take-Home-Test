import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/fontstyle.dart';
import '../../utils/margin.dart';
import '../../utils/responsive.dart';

// ignore: must_be_immutable
class ButtonSecondary extends StatelessWidget {
  ButtonSecondary({
    Key? key,
    this.tittle,
    required this.onPressed,
  }) : super(key: key);

  String? tittle;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: displayWidth(context),
      height: 50.0,
      child: ElevatedButton(
        onPressed: onPressed as void Function()?,
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
            side: BorderSide(
              color: greyTwoColor,
              width: 1.5,
            ),
          ),
        ),
        child: Text(
          tittle ?? 'Button Secondary',
          style: blackTextStyle.copyWith(
            fontSize: 16.0,
            fontWeight: medium,
          ),
        ),
      ),
    );
  }
}
