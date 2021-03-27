import 'package:flutter/material.dart';

final _nordTextStyle = TextStyle(
  fontFamily: 'Nunito',
  package: 'nord',
  fontFamilyFallback: [
    'Liberation Serif',
    'Noto Sans CJK',
    'Tibetan Machine Uni',
  ],
);
final nordHeadline1Style = _nordTextStyle;
final nordHeadline2Style = _nordTextStyle;
final nordHeadline3Style = _nordTextStyle;
final nordHeadline4Style = _nordTextStyle;
final nordHeadline5Style = _nordTextStyle;
final nordHeadline6Style = _nordTextStyle;
final nordSubtitle1Style = _nordTextStyle;
final nordSubtitle2Style = _nordTextStyle;
final nordBodyText1Style = _nordTextStyle;
final nordBodyText2Style = _nordTextStyle;
final nordCaptionStyle = _nordTextStyle;
final nordButtonStyle = _nordTextStyle;
final nordOverlineStyle = _nordTextStyle;

final nordTextTheme = TextTheme(
    headline1: nordHeadline1Style,
    headline2: nordHeadline2Style,
    headline3: nordHeadline3Style,
    headline4: nordHeadline4Style,
    headline5: nordHeadline5Style,
    headline6: nordHeadline6Style,
    subtitle1: nordSubtitle1Style,
    subtitle2: nordSubtitle2Style,
    bodyText1: nordBodyText1Style,
    bodyText2: nordBodyText2Style,
    caption: nordCaptionStyle,
    button: nordButtonStyle,
    overline: nordOverlineStyle);
