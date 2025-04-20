import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

Future<void> openLocationInMaps(String queryAddress) async {
  final encoded = Uri.encodeComponent(queryAddress);
  final uri =
      Platform.isIOS
          ? Uri.parse(
            'http://maps.apple.com/?q=$encoded',
          ) // opens in Apple Maps
          : Uri.parse('geo:0,0?q=$encoded'); // Android: opens intent chooser

  try {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } catch (e) {
    print('Could not launch map: $e');
  }
}
