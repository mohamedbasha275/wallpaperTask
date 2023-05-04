import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/extension/extensions.dart';
import 'package:wallpaper_app/core/resources/app_colors.dart';
import 'package:wallpaper_app/core/resources/app_strings.dart';
import 'package:wallpaper_app/core/resources/values_manager.dart';
import 'package:wallpaper_app/features/business_logic/favourites/favourite_cubit.dart';
import 'package:wallpaper_app/features/presentation/common/app_bar.dart';
import 'package:wallpaper_app/features/presentation/common/empty_widget.dart';
import 'package:wallpaper_app/features/presentation/common/loading_widget.dart';
import 'package:wallpaper_app/features/presentation/common/show_snackBar.dart';
import 'package:wallpaper_app/features/presentation/common/warning_widget.dart';
import 'package:wallpaper_app/features/presentation/widgets/wallpaper_item.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSize.s50),
        child: MyAppBar(title: AppStrings.favourites),
      ),
      body: BlocListener<FavouritesCubit, FavouritesState>(
        listener: (context, state) {
          if (state is RemoveFavourites) {
            return messageSnackBar(
              context,
              message: AppStrings.removedFavourite,
              bgColor: AppColors.info,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<FavouritesCubit, FavouritesState>(
                  builder: (context, state) {
                    if (state is FavouritesLoading) {
                      return const LoadingWidget();
                    } else if (state is FavouritesFailure) {
                      return WarningWidget(message: state.errorMessage);
                    } else if (state is FavouritesSuccess) {
                      return SizedBox(
                        width: context.screenWidth * 0.95,
                        child: GridView.builder(
                          itemCount: state.wallpapers.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.7,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (context, index) => WallPaperItem(
                            wallpaper: state.wallpapers[index],
                            addFavourite: true,
                          ),
                        ),
                      );
                    } else {
                      return EmptyWidget(message: AppStrings.noFavourites);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
