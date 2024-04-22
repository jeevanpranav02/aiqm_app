import 'package:flutter/material.dart';

class AppLayout {
  // Border Radius
  static BorderRadius borderRadiusMini = BorderRadius.circular(8.0);
  static BorderRadius borderRadiusSmall = BorderRadius.circular(12.0);
  static BorderRadius borderRadiusMedium = BorderRadius.circular(16.0);
  static BorderRadius borderRadiusLarge = BorderRadius.circular(20.0);
  static BorderRadius borderRadiusMediumTopLeftAndTopRight =
      const BorderRadius.only(
    topLeft: Radius.circular(16.0),
    topRight: Radius.circular(16.0),
  );
  static BorderRadius borderRadiusMediumBottomLeftAndBottomRight =
      const BorderRadius.only(
    bottomLeft: Radius.circular(16.0),
    bottomRight: Radius.circular(16.0),
  );

  // Padding
  static EdgeInsets paddingMini = const EdgeInsets.all(4.0);
  static EdgeInsets paddingSmall = const EdgeInsets.all(8.0);
  static EdgeInsets paddingMedium = const EdgeInsets.all(12.0);
  static EdgeInsets paddingLarge = const EdgeInsets.all(16.0);
  static EdgeInsets paddingExtraLarge = const EdgeInsets.all(20.0);

  // Spacers and SizedBox
  static Spacer constSpacer = const Spacer();
  static SizedBox verticalSpacer(double height) => SizedBox(
        height: height,
      );

  static SizedBox horizontalSpacer(double width) => SizedBox(
        width: width,
      );
}
