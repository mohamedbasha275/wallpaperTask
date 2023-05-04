import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/extension/extensions.dart';
import 'package:wallpaper_app/core/helper_functions/route_navigation.dart';
import 'package:wallpaper_app/core/resources/app_assets.dart';
import 'package:wallpaper_app/core/resources/app_colors.dart';
import 'package:wallpaper_app/core/resources/app_routers.dart';
import 'package:wallpaper_app/core/resources/values_manager.dart';
import 'package:wallpaper_app/features/business_logic/wallpapers/wallpapers_cubit.dart';
import 'package:wallpaper_app/features/presentation/common/empty_widget.dart';
import 'package:wallpaper_app/features/presentation/common/loading_widget.dart';
import 'package:wallpaper_app/features/presentation/common/no_app_bar.dart';
import 'package:wallpaper_app/features/presentation/common/warning_widget.dart';
import 'package:wallpaper_app/features/presentation/widgets/wallpaper_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: noAppBar,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: AppSize.s100,
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      ImageAssets.logo,
                    ),
                    Row(
                      children: [
                        Ink(
                          decoration: ShapeDecoration(
                            color: AppColors.secondary,
                            shape: const CircleBorder(),
                          ),
                          child: IconButton(
                            onPressed: () {
                              pushRoute(context, Routes.favouritesScreen);
                            },
                            icon: Icon(Icons.favorite,
                                size: AppSize.s30, color: AppColors.white),
                          ),
                        ),
                        const SizedBox(width: AppSize.s10),
                        Ink(
                          decoration: const ShapeDecoration(
                            color: AppColors.primary,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            onPressed: () {
                              pushRoute(context, Routes.searchScreen);
                            },
                            icon: Icon(Icons.search,
                                size: AppSize.s30, color: AppColors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<WallpapersCubit, WallpapersState>(
                builder: (context, state) {
                  if (state is WallpapersLoading) {
                    return const LoadingWidget();
                  } else if (state is WallpapersFailure) {
                    return WarningWidget(message: state.errorMessage);
                  } else if (state is WallpapersSuccess) {
                    return SizedBox(
                      width: context.screenWidth * 0.95,
                      child: GridView.builder(
                        itemCount: state.wallpapers.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) =>
                            WallPaperItem(wallpaper: state.wallpapers[index]),
                      ),
                    );
                  } else {
                    // Show empty widget
                    return const EmptyWidget();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
