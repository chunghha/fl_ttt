import 'package:flutter/material.dart';

import 'colors.dart';

final nordButtonThemeData = ButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)));

final nordOutlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(primary: nordBlack));

final nordDarkOutlinedButtonThemeData = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(primary: nordWhite));

final nordFloatingActionButtonThemeData = FloatingActionButtonThemeData(
    backgroundColor: nordRed, foregroundColor: nordBrightWhite);
