export './error_handler.dart';
export './show_snackbar.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

Future<List<File>> pickImages() async {
  List<File> images = [];
  try {
    var files = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );
    if (files != null && files.files.isNotEmpty) {
      for (int i = 0; i < files.files.length; i++) {
        images.add(File(files.files[i].path!));
      }
    }
  } catch (e) {
      print(e);
  }
  return images;
}