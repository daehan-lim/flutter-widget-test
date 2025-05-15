import 'package:first_app/ui/maps_intent/maps_intent.dart';
import 'package:flutter/material.dart';

class LocationModel {
  final String title;
  final String category;
  final String roadAddress;

  const LocationModel({
    required this.title,
    required this.category,
    required this.roadAddress,
  });
}

final sampleLocations = [
  LocationModel(
    title: '스타벅스 강남점',
    category: '카페 > 커피전문점',
    roadAddress: '서울 강남구 강남대로 396',
  ),
  LocationModel(
    title: '올리브영 명동점',
    category: '쇼핑 > 뷰티스토어',
    roadAddress: '서울 중구 명동8길 27',
  ),
  LocationModel(
    title: '파리바게뜨 잠실점',
    category: '음식점 > 베이커리',
    roadAddress: '서울 송파구 올림픽로 240',
  ),
];

class PlaceListPage extends StatelessWidget {
  const PlaceListPage({super.key});

  void openMap(String address) {
    openLocationInMaps(address);
  }

  void navigateTo(String address) {
    print('길찾기: $address');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // iOS-style
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const Text(
          '장소 목록',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: sampleLocations.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final location = sampleLocations[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  location.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  location.category,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black.withValues(alpha: 0.65),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.location_on_outlined,
                        size: 16, color: Colors.black.withValues(alpha: 0.8)),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        location.roadAddress,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withValues(alpha: 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _actionButton(
                      icon: Icons.map_outlined,
                      label: '지도 보기',
                      onTap: () => openMap(location.roadAddress),
                    ),
                    const SizedBox(width: 8),
                    _actionButton(
                      icon: Icons.directions_outlined,
                      label: '길찾기',
                      onTap: () => navigateTo(location.roadAddress),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _actionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return TextButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18, color: Colors.blueAccent),
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.blueAccent,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        backgroundColor: Colors.blue.withValues(alpha: 0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
