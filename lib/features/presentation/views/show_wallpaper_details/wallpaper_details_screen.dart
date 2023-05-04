import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/resources/app_assets.dart';
import 'package:wallpaper_app/core/resources/app_colors.dart';
import 'package:wallpaper_app/core/resources/app_strings.dart';
import 'package:wallpaper_app/core/resources/values_manager.dart';
import 'package:wallpaper_app/features/business_logic/favourites/favourite_cubit.dart';
import 'package:wallpaper_app/features/data/models/wallpaper_model.dart';
import 'package:wallpaper_app/features/presentation/common/app_bar.dart';
import 'package:wallpaper_app/features/presentation/common/show_snackBar.dart';
import 'package:wallpaper_app/features/presentation/components/download_btn.dart';

class WallpaperDetailsScreen extends StatefulWidget {
  final WallpaperModel wallpaper;

  const WallpaperDetailsScreen({required this.wallpaper, super.key});

  @override
  State<WallpaperDetailsScreen> createState() => _WallpaperDetailsScreenState();
}

class _WallpaperDetailsScreenState extends State<WallpaperDetailsScreen> {
  bool isInFavourite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSize.s50),
        child: MyAppBar(title: widget.wallpaper.photographer),
      ),
      body: BlocListener<FavouritesCubit, FavouritesState>(
        listener: (context, state) {
          if (state is AddFavourites) {
            return messageSnackBar(
              context,
              message: AppStrings.addedFavourite,
            );
          } else if (state is AddFavouritesFailure) {
            return messageSnackBar(context,
                message: state.message, bgColor: AppColors.failure);
          } else if (state is RemoveFavourites) {
            return messageSnackBar(context,
                message: AppStrings.removedFavourite, bgColor: AppColors.info);
          }
        },
        child: Stack(
          children: [
            Positioned.fill(
              child: FadeInImage(
                placeholder: const AssetImage(
                  ImageAssets.largePlaceholder,
                ),
                image: NetworkImage(widget.wallpaper.largeImage),
                fit: BoxFit.cover,
              ),
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DownLoadBtn(
                          id: widget.wallpaper.id,
                          url: widget.wallpaper.largeImage),
                      const SizedBox(width: AppSize.s16),
                      FutureBuilder<bool>(
                        future: _getIsInFavourite(context),
                        builder: (BuildContext context,
                            AsyncSnapshot<bool> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            isInFavourite = snapshot.data!;
                            return ElevatedButton(
                              onPressed: () async {
                                if (isInFavourite) {
                                  await BlocProvider.of<FavouritesCubit>(context)
                                      .removeFavourites(id: widget.wallpaper.id);
                                } else {
                                  await BlocProvider.of<FavouritesCubit>(context)
                                      .addFavourites(wallpaper: widget.wallpaper);
                                }
                                setState(() { // update the state of the widget
                                  isInFavourite = !isInFavourite;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.secondary,
                                shape: const CircleBorder(),
                              ),
                              child: Icon(
                                isInFavourite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: AppColors.white,
                              ),
                            );
                          } else {
                            return const CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSize.s10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // check if in in Favourite or not
  Future<bool> _getIsInFavourite(context) async {
    return await BlocProvider.of<FavouritesCubit>(context)
        .isFavourite(id: widget.wallpaper.id);
  }
}
