import 'package:flutter/material.dart';

// Solid Style Colors
Color primaryColor = const Color(0xFF4849D8);
Color secondaryColor = const Color(0xFF6464EE);
Color backgroundColor = const Color(0xFFE7E6EE);
Color whiteColor = const Color(0xFFFFFFFF);
Color blackColor = const Color(0xFF212525);
Color greyOneColor = const Color(0xFFD3D3FA);
Color greyTwoColor = const Color(0xFF919094);
Color greyThreeColor = const Color(0xFFe2e2e2);
Color yellowOneColor = const Color(0xFFFCCC74);
Color yellowTwoColor = const Color(0xFFFCB31C);
Color purpleColor = const Color(0xFFab2bc1);
Color blueOneColor = const Color(0xFFD3E0EE);
Color transparentColor = Colors.transparent;

//Gradient Style Colors
RadialGradient primaryGradient = RadialGradient(
  colors: [
    purpleColor,
    primaryColor,
  ],
  stops: const [
    0.5,
    1.0,
  ],
  center: Alignment.bottomRight,
  radius: 0.9,
);

// Shadow Style Colors
List<BoxShadow> defaultCardShadow = [
  BoxShadow(
    color: blackColor.withOpacity(0.1),
    blurRadius: 8,
    offset: const Offset(0, 4),
  ),
];
