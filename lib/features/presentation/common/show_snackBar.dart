import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/resources/app_constants.dart';
import 'package:wallpaper_app/core/resources/values_manager.dart';

void messageSnackBar(BuildContext context,
    {required String message, Color bgColor =  Colors.green}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(milliseconds: AppConstants.snackBarSpeedTime),
      backgroundColor: bgColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(AppSize.s20),
          topLeft: Radius.circular(AppSize.s20),
        ),
      ),
      content: Text(
        message,
        style: Theme.of(context).textTheme.titleSmall,
        textAlign: TextAlign.center,
      ),
    ),
  );
}
