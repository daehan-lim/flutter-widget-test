import 'dart:ui';

Color hexColor(String hexCode) {
  return Color(int.parse(hexCode.replaceAll('#', '0xFF')));
}