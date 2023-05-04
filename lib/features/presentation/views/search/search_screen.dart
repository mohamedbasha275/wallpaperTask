import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper_app/core/extension/extensions.dart';
import 'package:wallpaper_app/core/resources/app_assets.dart';
import 'package:wallpaper_app/core/resources/app_colors.dart';
import 'package:wallpaper_app/core/resources/app_strings.dart';
import 'package:wallpaper_app/core/resources/values_manager.dart';
import 'package:wallpaper_app/features/business_logic/search/search_cubit.dart';
import 'package:wallpaper_app/features/data/models/wallpaper_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wallpaper_app/features/presentation/common/app_bar.dart';
import 'package:wallpaper_app/features/presentation/common/empty_widget.dart';
import 'package:wallpaper_app/features/presentation/common/loading_widget.dart';
import 'package:wallpaper_app/features/presentation/common/warning_widget.dart';
import 'package:wallpaper_app/features/presentation/widgets/wallpaper_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(AppSize.s50),
        child: MyAppBar(title: AppStrings.search),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  hintText: AppStrings.searchNow,
                  contentPadding: const EdgeInsets.all(AppPadding.p20)),
              onChanged: (value) {
                BlocProvider.of<SearchCubit>(context).searchWallpapers(value);
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const LoadingWidget();
                } else if (state is SearchSuccess) {
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
                  return EmptyWidget(message: AppStrings.noSearchResults,);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
