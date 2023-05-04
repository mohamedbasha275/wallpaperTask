// ignore_for_file: use_build_context_synchronously
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wallpaper_app/core/resources/app_colors.dart';
import 'package:wallpaper_app/core/resources/app_fonts.dart';
import 'package:wallpaper_app/core/resources/app_strings.dart';
import 'package:wallpaper_app/core/resources/values_manager.dart';
import 'package:wallpaper_app/features/presentation/common/show_snackBar.dart';

class DownLoadBtn extends StatelessWidget {
  final int id;
  final String url;

  const DownLoadBtn({Key? key, required this.id, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final directory = await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/wallpaper$id.png';
        if (!await Directory(directory.path).exists()) {
          await Directory(directory.path).create(recursive: true);
        }
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Row(
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(width: AppSize.s10),
                  Text(AppStrings.downloading),
                ],
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    Text(AppStrings.wait),
                  ],
                ),
              ),
            );
          },
        );
        final dio = Dio();
        try {
          final response = await dio.download(
            url,
            filePath,
            // onReceiveProgress: (received, total) {
            //   if (total != -1) {
            //     print((received / total * 100).toStringAsFixed(0) + '%');
            //   }
            // },
          );

          if (response.statusCode == 200) {
            Navigator.pop(context);
            final file = File(filePath);
            await GallerySaver.saveImage(file.path);
            messageSnackBar(
              context,
              message: AppStrings.savedGallery,
            );
          } else {
            messageSnackBar(
              context,
              message: AppStrings.failedGallery,
              bgColor: AppColors.failure,
            );
          }
        } catch (e) {
          messageSnackBar(
            context,
            message: '${AppStrings.failedDownload} ${e.toString()}',
            bgColor: AppColors.failure,
          );
        }
        // finally {
        //   //Navigator.of(context, rootNavigator: true).pop();
        // }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          AppPadding.p8,
        ),
        child: Row(
          children: [
            Text(
              AppStrings.download,
              style: TextStyle(
                fontSize: FontSize.s16,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            const SizedBox(
              width: AppSize.s4,
            ),
            const Icon(Icons.download_rounded),
          ],
        ),
      ),
    );
  }
}
