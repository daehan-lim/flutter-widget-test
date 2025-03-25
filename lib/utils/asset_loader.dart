import 'package:flutter/services.dart' show rootBundle;

Future<String> loadMarkdownAsset(String filename) async {
  return await rootBundle.loadString('assets/md/$filename');
}
