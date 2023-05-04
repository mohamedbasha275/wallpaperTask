import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/helper_functions/route_navigation.dart';
import 'package:wallpaper_app/core/resources/app_assets.dart';
import 'package:wallpaper_app/core/resources/app_colors.dart';
import 'package:wallpaper_app/core/resources/app_fonts.dart';
import 'package:wallpaper_app/core/resources/app_routers.dart';
import 'package:wallpaper_app/core/resources/app_strings.dart';
import 'package:wallpaper_app/core/resources/values_manager.dart';
import 'package:wallpaper_app/features/business_logic/favourites/favourite_cubit.dart';
import 'package:wallpaper_app/features/data/models/wallpaper_model.dart';

class WallPaperItem extends StatelessWidget {
  final WallpaperModel wallpaper;
  final bool addFavourite;

  const WallPaperItem(
      {required this.wallpaper, this.addFavourite = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return pushRoute(context, Routes.showWallpaperDetails,
            arguments: wallpaper);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSize.s20),
          color: AppColors.grey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(AppSize.s20),
                topLeft: Radius.circular(AppSize.s20),
              ),
              child: SizedBox(
                height: AppSize.s180,
                child: FadeInImage(
                  placeholder: const AssetImage(ImageAssets.smallPlaceholder),
                  image: NetworkImage(wallpaper.tinyImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: AppSize.s10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: AppSize.s100,
                  child: Text(
                    '${AppStrings.by} ${wallpaper.photographer}',
                    style: TextStyle(
                      fontSize: FontSize.s15,
                      color: AppColors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (addFavourite)
                  ElevatedButton(
                    onPressed: () async {
                      BlocProvider.of<FavouritesCubit>(context).removeFavourites(id: wallpaper.id);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.secondary,
                      shape: const CircleBorder(),
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.white,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
