import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/extension/extensions.dart';
import 'package:wallpaper_app/core/resources/app_assets.dart';
import 'package:wallpaper_app/core/resources/app_fonts.dart';
import 'package:wallpaper_app/core/resources/app_strings.dart';
import 'package:wallpaper_app/core/resources/values_manager.dart';

class EmptyWidget extends StatelessWidget {
  final String message;

  const EmptyWidget({Key? key, this.message = AppStrings.noData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAssets.empty,
                  width: AppSize.s100,
                ),
                const SizedBox(
                  width: AppSize.s10,
                ),
                const Text(
                  AppStrings.empty,
                  style: TextStyle(
                    fontSize: FontSize.s22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSize.s10),
            Text(
              message,
              style: const TextStyle(
                fontSize: FontSize.s16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
