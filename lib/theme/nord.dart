library nord;

import 'dart:ui';
import 'package:flutter/material.dart';

import 'button_styles.dart';
import 'colors.dart';
import 'text_styles.dart';

final nordAppBarLightTheme = AppBarTheme(
  brightness: Brightness.light,
  color: nordBrightWhite,
  textTheme: nordTextTheme.copyWith(
      headline6: nordHeadline6Style.copyWith(
    color: nordBlack,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  )),
  iconTheme: IconThemeData(color: nordBlack),
  actionsIconTheme: IconThemeData(color: nordBrightRed),
);

final nordAppBarDarkTheme = AppBarTheme(
  brightness: Brightness.dark,
  color: nordBlack,
  textTheme: nordTextTheme.copyWith(
      headline6: nordHeadline6Style.copyWith(
    color: nordBrightWhite,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  )),
  iconTheme: IconThemeData(color: nordBrightWhite),
  actionsIconTheme: IconThemeData(color: nordRed),
);

final nordAppBarTheme = AppBarTheme(
  brightness: Brightness.dark,
  color: nordBrightBlue,
  textTheme: nordTextTheme.copyWith(
      headline6: nordHeadline6Style.copyWith(
    color: nordBlack,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  )),
  iconTheme: IconThemeData(color: nordBlack),
  actionsIconTheme: IconThemeData(color: nordRed),
);

final nordTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: nordLightColorScheme.primary,
    primaryColorBrightness:
        ThemeData.estimateBrightnessForColor(nordLightColorScheme.primary),
    canvasColor: nordLightColorScheme.background,
    accentColor: nordLightColorScheme.secondary,
    accentColorBrightness:
        ThemeData.estimateBrightnessForColor(nordLightColorScheme.secondary),
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
    appBarTheme: nordAppBarTheme);

final nordLightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: nordLightColorScheme.primary,
    primaryColorBrightness:
        ThemeData.estimateBrightnessForColor(nordLightColorScheme.primary),
    canvasColor: nordLightColorScheme.background,
    accentColor: nordLightColorScheme.secondary,
    accentColorBrightness:
        ThemeData.estimateBrightnessForColor(nordLightColorScheme.secondary),
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
    appBarTheme: nordAppBarLightTheme);

final nordDarkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: nordDarkColorScheme.surface,
    primaryColorBrightness:
        ThemeData.estimateBrightnessForColor(nordDarkColorScheme.surface),
    canvasColor: nordDarkColorScheme.background,
    accentColor: nordDarkColorScheme.secondary,
    accentColorBrightness:
        ThemeData.estimateBrightnessForColor(nordDarkColorScheme.secondary),
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
    appBarTheme: nordAppBarDarkTheme);
