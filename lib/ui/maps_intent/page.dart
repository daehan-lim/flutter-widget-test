import 'package:flutter/material.dart';

import 'maps_intent.dart';
// Make sure you also import your map picker helper file
// import 'path_to_showMapAppPicker_function.dart';

class PlaceListPage extends StatelessWidget {
  const PlaceListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Places')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Coex Mall'),
            subtitle: const Text('Seoul, Gangnam-gu, Yeongdong-daero 513'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              openLocationInMaps('Coex Mall Seoul');
            },
          ),
          ListTile(
            title: const Text('Gyeongbokgung Palace'),
            subtitle: const Text('161 Sajik-ro, Jongno-gu, Seoul'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              openLocationInMaps('Gyeongbokgung Palace');
            },
          ),
          ListTile(
            title: const Text('Busan Station'),
            subtitle: const Text('206 Jungang-daero, Dong-gu, Busan'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              openLocationInMaps('Busan Station');
            },
          ),
        ],
      ),
    );
  }
}
