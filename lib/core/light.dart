import 'package:flutter/material.dart';
import 'package:tomato/core/color_light.dart';

ThemeData getThemeDataLight()=>ThemeData(
  disabledColor: ColorManager.black,
  backgroundColor: ColorManager.primary,
  splashColor: ColorManager.descriptionColor,
  primaryColor: ColorManager.primary,
  cardColor: ColorManager.descriptionColor,
  buttonTheme: ButtonThemeData(
    buttonColor: ColorManager.buttonColor,
    splashColor: ColorManager.buttonColor,
  ),


);