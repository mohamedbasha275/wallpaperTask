import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/extension/extensions.dart';
import 'package:wallpaper_app/core/resources/app_colors.dart';
import 'package:wallpaper_app/core/resources/app_fonts.dart';
import 'package:wallpaper_app/core/resources/app_strings.dart';
import 'package:wallpaper_app/core/resources/values_manager.dart';

class LoadingForm extends StatelessWidget {
  final Color color;
  const LoadingForm({Key? key,this.color = AppColors.primary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.s5),
              color: color,
            ),
            padding: const EdgeInsets.all(AppPadding.p10),
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: CircularProgressIndicator(color: AppColors.white),
            )),
      ],
    );
  }
}
