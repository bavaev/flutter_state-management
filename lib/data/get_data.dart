import 'package:flutter/services.dart';

Future<String> fetchFile(String assetsPath) async {
  try {
    return await rootBundle.loadString(assetsPath);
  } catch (e) {
    return 'Error';
  }
}
