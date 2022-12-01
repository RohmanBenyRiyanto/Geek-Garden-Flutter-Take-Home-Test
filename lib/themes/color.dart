import 'package:flutter/material.dart';

// Solid Style Colors
Color primaryColor = const Color(0xFF440A59);
Color secondaryColor = const Color(0xFFADA9EF);
Color backgroundColor = const Color(0xFFF6F6F5);
Color whiteColor = const Color(0xFFFFFFFF);
Color blackColor = const Color(0xFF212525);
Color greyOneColor = const Color(0xFF717E95);
Color greyTwoColor = const Color(0xFFC4C4C4);
Color greyThreeColor = const Color(0xFFEEF2F8);
Color yellowOneColor = const Color(0xFFFCCC74);
Color yellowTwoColor = const Color(0xFFFCB31C);
Color blueOneColor = const Color(0xFFD3E0EE);
Color transparentColor = Colors.transparent;

//Gradient Style Colors
LinearGradient primaryGradient = const LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment.topRight,
  colors: [
    Color(0xFFF6924A),
    Color(0xFFFFB731),
  ],
);

// Shadow Style Colors
List<BoxShadow> defaultCardShadow = [
  BoxShadow(
    color: greyTwoColor.withOpacity(0.1),
    spreadRadius: 4,
    offset: const Offset(0, 0),
    blurRadius: 6,
  ),
];
