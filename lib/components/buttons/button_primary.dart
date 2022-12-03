import 'package:flutter/material.dart';

import '../../utils/color.dart';
import '../../utils/fontstyle.dart';
import '../../utils/margin.dart';
import '../../utils/responsive.dart';

class ButtonPrimary extends StatelessWidget {
  ButtonPrimary({
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
          primary: primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
        child: Text(
          tittle ?? 'Button',
          style: whiteTextStyle.copyWith(
            fontSize: 16.0,
            fontWeight: semiBold,
          ),
        ),
      ),
    );
  }
}
