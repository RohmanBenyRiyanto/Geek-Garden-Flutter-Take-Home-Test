import 'package:flutter/material.dart';
import 'package:flutter_home_test/utils/color.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: whiteColor,
      highlightColor: greyThreeColor,
      period: const Duration(milliseconds: 1000),
      child: child,
    );
  }
}
