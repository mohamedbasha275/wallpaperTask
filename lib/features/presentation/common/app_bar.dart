import 'package:flutter/material.dart';
import 'package:wallpaper_app/core/helper_functions/route_navigation.dart';
import 'package:wallpaper_app/core/resources/app_colors.dart';
import 'package:wallpaper_app/core/resources/app_routers.dart';

class MyAppBar extends StatelessWidget {
  final String title;

  const MyAppBar({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new, color: AppColors.black),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          IconButton(
            onPressed: () {
              pushAndRemoveRoute(context, Routes.home);
            },
            icon: Icon(
              Icons.home,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
