import 'package:flutter/material.dart';

//Style Size Widget and Screen

Size displaySize(BuildContext context) {
  debugPrint('Size = ${MediaQuery.of(context).size}');
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ${displaySize(context).height}');
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ${displaySize(context).width}');
  return displaySize(context).width;
}

double getOrientation(BuildContext context) {
  if (MediaQuery.of(context).orientation == Orientation.landscape) {
    return 0;
  } else {
    return 1;
  }
}
