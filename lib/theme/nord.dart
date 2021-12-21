library nord;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'button_styles.dart';
import 'colors.dart';
import 'text_styles.dart';

final nordAppBarLightTheme = AppBarTheme(
  color: nordBrightWhite,
  iconTheme: IconThemeData(color: nordBlack),
  actionsIconTheme: IconThemeData(color: nordBrightRed),
  toolbarTextStyle: nordTextTheme
      .copyWith(
        headline6: nordHeadline6Style.copyWith(
          color: nordBlack,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      )
      .bodyText2,
  titleTextStyle: nordTextTheme
      .copyWith(
        headline6: nordHeadline6Style.copyWith(
          color: nordBlack,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      )
      .headline6,
  systemOverlayStyle: SystemUiOverlayStyle.dark,
);

final nordAppBarDarkTheme = AppBarTheme(
  color: nordBlack,
  iconTheme: IconThemeData(color: nordBrightWhite),
  actionsIconTheme: IconThemeData(color: nordRed),
  toolbarTextStyle: nordTextTheme
      .copyWith(
        headline6: nordHeadline6Style.copyWith(
          color: nordBrightWhite,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      )
      .bodyText2,
  titleTextStyle: nordTextTheme
      .copyWith(
        headline6: nordHeadline6Style.copyWith(
          color: nordBrightWhite,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      )
      .headline6,
  systemOverlayStyle: SystemUiOverlayStyle.light,
);

final nordAppBarTheme = AppBarTheme(
  color: nordBrightBlue,
  iconTheme: IconThemeData(color: nordBlack),
  actionsIconTheme: IconThemeData(color: nordRed),
  toolbarTextStyle: nordTextTheme
      .copyWith(
        headline6: nordHeadline6Style.copyWith(
          color: nordBlack,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      )
      .bodyText2,
  titleTextStyle: nordTextTheme
      .copyWith(
        headline6: nordHeadline6Style.copyWith(
          color: nordBlack,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      )
      .headline6,
  systemOverlayStyle: SystemUiOverlayStyle.light,
);

final nordTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: nordLightColorScheme.primary,
  canvasColor: nordLightColorScheme.background,
  scaffoldBackgroundColor: nordLightColorScheme.background,
  bottomAppBarColor: nordLightColorScheme.surface,
  cardColor: nordLightColorScheme.surface,
  dividerColor: nordLightColorScheme.onSurface.withOpacity(0.12),
  backgroundColor: nordLightColorScheme.background,
  dialogBackgroundColor: nordLightColorScheme.background,
  errorColor: nordLightColorScheme.error,
  textTheme: nordTextTheme,
  indicatorColor: nordLightColorScheme.onPrimary,
  applyElevationOverlayColor: false,
  colorScheme: nordLightColorScheme,
  buttonTheme: nordButtonThemeData,
  outlinedButtonTheme: nordOutlinedButtonThemeData,
  floatingActionButtonTheme: nordFloatingActionButtonThemeData,
  toggleableActiveColor: nordBlue,
  appBarTheme: nordAppBarTheme,
);

final nordLightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: nordLightColorScheme.primary,
  canvasColor: nordLightColorScheme.background,
  scaffoldBackgroundColor: nordLightColorScheme.background,
  bottomAppBarColor: nordLightColorScheme.surface,
  cardColor: nordLightColorScheme.background,
  dividerColor: nordLightColorScheme.onSurface.withOpacity(0.12),
  backgroundColor: nordLightColorScheme.background,
  dialogBackgroundColor: nordLightColorScheme.background,
  errorColor: nordLightColorScheme.error,
  textTheme: nordTextTheme,
  indicatorColor: nordLightColorScheme.onPrimary,
  applyElevationOverlayColor: false,
  colorScheme: nordLightColorScheme,
  buttonTheme: nordButtonThemeData,
  outlinedButtonTheme: nordOutlinedButtonThemeData,
  floatingActionButtonTheme: nordFloatingActionButtonThemeData,
  toggleableActiveColor: nordBlue,
  appBarTheme: nordAppBarLightTheme,
);

final nordDarkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: nordDarkColorScheme.surface,
  canvasColor: nordDarkColorScheme.background,
  scaffoldBackgroundColor: nordDarkColorScheme.background,
  bottomAppBarColor: nordDarkColorScheme.surface,
  cardColor: nordDarkColorScheme.surface,
  dividerColor: nordDarkColorScheme.onSurface.withOpacity(0.12),
  backgroundColor: nordDarkColorScheme.background,
  dialogBackgroundColor: nordDarkColorScheme.background,
  errorColor: nordDarkColorScheme.error,
  textTheme: nordTextTheme,
  indicatorColor: nordDarkColorScheme.onPrimary,
  applyElevationOverlayColor: true,
  colorScheme: nordDarkColorScheme,
  buttonTheme: nordButtonThemeData,
  outlinedButtonTheme: nordDarkOutlinedButtonThemeData,
  floatingActionButtonTheme: nordFloatingActionButtonThemeData,
  toggleableActiveColor: nordBlue,
  appBarTheme: nordAppBarDarkTheme,
);
