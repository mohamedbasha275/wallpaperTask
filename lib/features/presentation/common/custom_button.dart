import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/resources/app_colors.dart';
import 'package:wallpaper_app/core/resources/values_manager.dart';

class CustomButton extends StatelessWidget {
  final Function function;
  final Color backGroundColor;
  final String title;
  final OutlinedBorder shape;
  final Size size;
  final double padding;

  const CustomButton(
      {required this.function,
      required this.title,
      this.backGroundColor = AppColors.primary,
      this.padding = AppPadding.p0,
      this.shape = const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(AppSize.s8))),
      this.size = Size.infinite,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        function();
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(size),
        shape: MaterialStateProperty.all(shape),
        backgroundColor: MaterialStateProperty.all(backGroundColor),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: padding, horizontal: AppPadding.p10),
        ),
      ),
      child: Text(title),
    );
  }
}
