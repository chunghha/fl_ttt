import 'package:flutter/material.dart';
import 'package:supercharged/supercharged.dart';

final nordBlack = '#2e3440'.toColor();
final nordWhite = '#f9f9f7'.toColor();
final nordRed = '#e64569'.toColor();
final nordGreen = '#89d287'.toColor();
final nordYellow = '#dab752'.toColor();
final nordBlue = '#439ecf'.toColor();
final nordMagenta = '#d961dc'.toColor();
final nordCyan = '#64aaaf'.toColor();

final nordBrightBlack = '#434c5e'.toColor();
final nordBrightWhite = '#fffffc'.toColor();
final nordBrightRed = '#e4859a'.toColor();
final nordBrightGreen = '#a2cca1'.toColor();
final nordBrightYellow = '#e1e387'.toColor();
final nordBrightBlue = '#6fbbe2'.toColor();
final nordBrightMagenta = '#e586e7'.toColor();
final nordBrightCyan = '#96dcda'.toColor();

final nordLightColorScheme = ColorScheme.fromSwatch(
    // * http://mcg.mbitson.com/#!?mcgpalette0=%23439ecf
    primarySwatch: MaterialColor(nordBlue.value, {
      50: '#e8f3f9'.toColor(),
      100: '#c7e2f1'.toColor(),
      200: '#a1cfe7'.toColor(),
      300: '#7bbbdd'.toColor(),
      400: '#5fadd6'.toColor(),
      500: nordBlue,
      600: '#3d96ca'.toColor(),
      700: '#348cc3'.toColor(),
      800: '#2c82bd'.toColor(),
      900: '#1e70b2'.toColor(),
    }),
    primaryColorDark: nordBlue,
    accentColor: nordRed,
    cardColor: nordWhite,
    backgroundColor: nordWhite,
    errorColor: nordRed,
    brightness: Brightness.light);

final nordDarkColorScheme = ColorScheme.fromSwatch(
    // * http://mcg.mbitson.com/#!?mcgpalette0=%236fbbe2
    primarySwatch: MaterialColor(nordBrightBlue.value, {
      50: '#eef7fc'.toColor(),
      100: '#d4ebf6'.toColor(),
      200: '#b7ddf1'.toColor(),
      300: '#9acfeb'.toColor(),
      400: '#85c5e6'.toColor(),
      500: nordBrightBlue,
      600: '#67b5df'.toColor(),
      700: '#5cacda'.toColor(),
      800: '#52a4d6'.toColor(),
      900: '#4d96cf'.toColor(),
    }),
    primaryColorDark: nordBrightBlue,
    accentColor: nordBrightRed,
    cardColor: nordBlack,
    backgroundColor: nordBrightBlack,
    errorColor: nordBrightRed,
    brightness: Brightness.dark);
