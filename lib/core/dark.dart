import 'package:flutter/material.dart';
import 'package:tomato/core/color_dark.dart';

dynamic getThemeDataDark()=>ThemeData(
  disabledColor: ColorManagerDark.textColor,
  backgroundColor: ColorManagerDark.primary,
  splashColor: ColorManagerDark.lightGrayOver,
  cardColor: ColorManagerDark.buttonColor,
  primaryColor: ColorManagerDark.buttonNavigationBarIcon,
  buttonTheme: ButtonThemeData(
    buttonColor: ColorManagerDark.buttonColor,
    splashColor: ColorManagerDark.buttonColor,
  ),


);