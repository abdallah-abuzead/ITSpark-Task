import 'dart:io';

import 'package:external_path/external_path.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path/path.dart';

import '../constants/app_strings.dart';

class AppFunctions {
  static Future<String?> saveImageExternally(String pickedImagePath) async {
    if (pickedImagePath.isEmpty) return null;

    String fileExtension = extension(pickedImagePath);
    String dir = dirname(pickedImagePath);
    int now = DateTime.now().millisecondsSinceEpoch;
    String newName = join(dir, '$now$fileExtension');

    File tempFile = await File(pickedImagePath).copy(newName);

    /// save image to gallery
    await GallerySaver.saveImage(tempFile.path, albumName: AppStrings.appName, toDcim: true);
    String savedPath = await ExternalPath.getExternalStoragePublicDirectory(
      '${ExternalPath.DIRECTORY_DCIM}/'
      '${AppStrings.appName}/'
      '$now$fileExtension',
    );
    return savedPath;
  }

  static Future<void> deleteFile(String? filePath) async {
    if (filePath == null) return;
    File file = File(filePath);
    try {
      if (await file.exists()) await file.delete();
    } catch (e) {
      print(e);
    }
  }
}
