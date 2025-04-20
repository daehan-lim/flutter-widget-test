import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

Future<void> openLocationInMaps(String queryAddress) async {
  final encoded = Uri.encodeComponent(queryAddress);

  if (Platform.isIOS) {
    final appName = 'com.daehan.firstApp';
    final naverUri = Uri.parse(
      'nmap://search?query=$encoded&appname=$appName',
    );

    try {
      await launchUrl(naverUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      print('Failed to open Naver Maps. Falling back to Apple Maps: $e');
      final appleUri = Uri.parse('http://maps.apple.com/?q=$encoded');
      try {
        await launchUrl(appleUri, mode: LaunchMode.externalApplication);
      } catch (e2) {
        print('Failed to open Apple Maps: $e2');
      }
    }
  } else {
    final geoUri = Uri.parse('geo:0,0?q=$encoded');
    try {
      await launchUrl(geoUri, mode: LaunchMode.externalApplication);
    } catch (e) {
      print('Could not launch map: $e');
    }
  }
}
