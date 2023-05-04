import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/extension/extensions.dart';
import 'package:wallpaper_app/core/helper_functions/route_navigation.dart';
import 'package:wallpaper_app/core/resources/app_assets.dart';
import 'package:wallpaper_app/core/resources/app_colors.dart';
import 'package:wallpaper_app/core/resources/app_fonts.dart';
import 'package:wallpaper_app/core/resources/app_routers.dart';
import 'package:wallpaper_app/core/resources/app_strings.dart';
import 'package:wallpaper_app/core/resources/values_manager.dart';

class WarningWidget extends StatelessWidget {
  final String message;

  const WarningWidget({Key? key, required this.message}) : super(key: key);

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
                  ImageAssets.error,
                  width: AppSize.s100,
                ),
                const SizedBox(
                  width: AppSize.s10,
                ),
                const Text(
                  AppStrings.error,
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
            const SizedBox(height: AppSize.s10),
            ElevatedButton(
              onPressed: () {
                pushAndRemoveRoute(context, Routes.home);
              },
              child: const Text(AppStrings.backHome),
            )
          ],
        ),
      ),
    );
  }
}
