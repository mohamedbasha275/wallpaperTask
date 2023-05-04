import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/extension/extensions.dart';
import 'package:wallpaper_app/core/resources/app_fonts.dart';
import 'package:wallpaper_app/core/resources/app_strings.dart';
import 'package:wallpaper_app/core/resources/values_manager.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: AppSize.s10),
            Text(
              AppStrings.loading,
              style: TextStyle(fontSize: FontSize.s16),
            ),
          ],
        ),
      ),
    );
  }
}
