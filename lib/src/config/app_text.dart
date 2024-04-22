import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppText {
  // Font name
  static const String fontName = 'Inter';

  // Font size
  static const double textSizeH1 = 23;
  static const double textSizeH2 = 21;
  static const double textSizeH3 = 19;
  static const double textSizeH4 = 17;
  static const double textSizeP = 14;
  static const double textSizeMini = 12;

  // Font weight
  static const FontWeight fontWeightThin = FontWeight.w100;
  static const FontWeight fontWeightExtraLight = FontWeight.w200;
  static const FontWeight fontWeightLight = FontWeight.w300;
  static const FontWeight fontWeightRegular = FontWeight.w400;
  static const FontWeight fontWeightMedium = FontWeight.w500;
  static const FontWeight fontWeightSemiBold = FontWeight.w600;
  static const FontWeight fontWeightBold = FontWeight.w700;
  static const FontWeight fontWeightExtraBold = FontWeight.w800;
  static const FontWeight fontWeightBlack = FontWeight.w900;

  // Font style
  static const FontStyle fontStyleNormal = FontStyle.normal;
  static const FontStyle fontStyleItalic = FontStyle.italic;

  // Text Style
  static const TextStyle textStyleAppBar = TextStyle(
    fontFamily: fontName,
    fontSize: textSizeH3,
    color: AppColors.primaryTextColor,
    fontWeight: fontWeightSemiBold,
  );
  static const TextStyle textStyleHeading = TextStyle(
    fontFamily: fontName,
    fontSize: textSizeH1,
    color: AppColors.primaryTextColor,
    fontWeight: fontWeightBold,
    fontStyle: fontStyleNormal,
  );

  static const TextStyle textStyleSubHeading = TextStyle(
    fontFamily: fontName,
    fontSize: textSizeH2,
    fontWeight: fontWeightBold,
    color: AppColors.primaryTextColor,
    fontStyle: fontStyleNormal,
  );

  static const TextStyle textStyleTitle = TextStyle(
    fontFamily: fontName,
    color: AppColors.primaryTextColor,
    fontSize: textSizeH3,
    fontWeight: fontWeightBold,
    fontStyle: fontStyleNormal,
  );

  static const TextStyle textStyleSubtitle = TextStyle(
    fontFamily: fontName,
    fontSize: textSizeH4,
    color: AppColors.primaryTextColor,
    fontWeight: fontWeightBold,
    fontStyle: fontStyleNormal,
  );

  static const TextStyle textStyleBody = TextStyle(
    fontFamily: fontName,
    fontSize: textSizeP,
    color: AppColors.primaryTextColor,
    fontWeight: fontWeightRegular,
    fontStyle: fontStyleNormal,
  );

  static TextStyle textStyleHint = TextStyle(
    fontFamily: fontName,
    fontSize: textSizeP,
    color: AppColors.primaryTextColor.withOpacity(0.5),
    fontWeight: fontWeightRegular,
    fontStyle: fontStyleNormal,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    fontFamily: fontName,
    fontSize: textSizeP,
    color: AppColors.primaryTextColor,
    fontWeight: fontWeightBold,
    fontStyle: fontStyleNormal,
  );
}
