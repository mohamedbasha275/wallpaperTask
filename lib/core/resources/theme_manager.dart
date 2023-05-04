import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallpaper_app/core/resources/app_colors.dart';
import 'package:wallpaper_app/core/resources/app_fonts.dart';
import 'package:wallpaper_app/core/resources/text_styles_manager.dart';
import 'package:wallpaper_app/core/resources/values_manager.dart';

ThemeData lightTheme = ThemeData(
  // main colors
  primarySwatch: AppColors.primarySwatch,
  primaryColor: AppColors.primary,
  primaryColorLight: AppColors.white,
  //primaryColorDark: AppColors.darkPrimary,
  disabledColor: AppColors.grey,
  splashColor: AppColors.splash,
  // ripple effect color

  // card view theme
  cardTheme: CardTheme(
    color: AppColors.white,
    shadowColor: AppColors.grey,
    elevation: AppSize.s4,
  ),

  // app bar theme
  appBarTheme: AppBarTheme(
    //centerTitle: false,
    color: AppColors.white,
    elevation: AppSize.s3,
    shadowColor: AppColors.white,
    titleTextStyle:
    getRegularStyle(fontSize: FontSize.s16, color: AppColors.black),
    // setStatusBarAndNavigationBarColors
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.white,
      statusBarColor: AppColors.white,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: AppColors.transparentColor,
    ),
    // systemOverlayStyle: SystemUiOverlayStyle(
    //   systemNavigationBarColor: AppColors.primary,
    //   statusBarColor: AppColors.primary,
    //   statusBarBrightness: Brightness.dark,
    //   systemNavigationBarIconBrightness: Brightness.light,
    //   systemNavigationBarDividerColor: AppColors.transparentColor,
    // ),
  ),

  // button theme
  buttonTheme: ButtonThemeData(
    shape: const StadiumBorder(),
    disabledColor: AppColors.grey,
    buttonColor: AppColors.primary,
    splashColor: AppColors.splash,
  ),

  // elevated button them
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: getRegularStyle(color: AppColors.white,
          fontSize: FontSize.s22),
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
    ),
  ),

  // text theme
  textTheme: TextTheme(
    displayLarge:
    getSemiBoldStyle(color: AppColors.black, fontSize: FontSize.s20),
    headlineLarge: getSemiBoldStyle(color: AppColors.black, fontSize: FontSize.s25),
    headlineMedium:
    getRegularStyle(color: AppColors.white, fontSize: FontSize.s17),
    titleMedium:
    getMediumStyle(color: AppColors.black, fontSize: FontSize.s16),
    titleSmall:
    getMediumStyle(color: AppColors.white, fontSize: FontSize.s16),
    bodyLarge: getRegularStyle(color: AppColors.black),
    bodySmall: getRegularStyle(color: AppColors.grey),
    labelSmall:
    getRegularStyle(color: AppColors.primary, fontSize: AppSize.s12),
    bodyMedium:
    getRegularStyle(color: AppColors.black, fontSize: AppSize.s12),
    labelLarge: getSemiBoldStyle(color: AppColors.primary,fontSize: FontSize.s16),

  ),

  // input decoration theme (text form field)
  inputDecorationTheme: InputDecorationTheme(
    // content padding
    contentPadding: const EdgeInsets.all(AppPadding.p8),
    // hint style
    hintStyle: getRegularStyle(color: AppColors.grey, fontSize: FontSize.s14),
    labelStyle: getMediumStyle(color: AppColors.grey, fontSize: FontSize.s14),
    errorStyle: getRegularStyle(color: AppColors.reset),
    // enabled border style
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.grey, width: AppSize.s1_5),
      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
    // focused border style
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
    // error border style
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.reset, width: AppSize.s1_5),
      borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
    // focused border style
    focusedErrorBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary, width: AppSize.s1_5),
      borderRadius: BorderRadius.all(Radius.circular(AppSize.s8)),
    ),
  ),
  fontFamily: FontConstants.fontFamily,
);
ThemeData getApplicationTheme() {
  return lightTheme;
}
