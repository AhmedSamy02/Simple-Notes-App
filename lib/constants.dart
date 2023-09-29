import 'package:flutter/material.dart';
import 'dart:math';

const kHomeScreen = 'HomeScreen';
const kEditScreen = 'EditScreen';
const kHiveBoxName = 'Notes Box';
const kAppBarPrimaryColor = Color(0xFF303030);
const kSearchButtonBackgroundColor = Color(0xFF3B3B3B);
const kAppBarSecondaryColor = Colors.white70;

String generateRandomColor() {
  Random random = Random();

  // Define the range of acceptable RGB values around the provided colors
  int minRange = 50;
  int maxRange = 80;

  // Generate random RGB values within the acceptable range
  int r = _generateRandomInRange(random, _hexToR('FFCD7A'), minRange, maxRange);
  int g = _generateRandomInRange(random, _hexToG('FFCD7A'), minRange, maxRange);
  int b = _generateRandomInRange(random, _hexToB('FFCD7A'), minRange, maxRange);

  String hexColor = _rgbToHex(r, g, b);

  return hexColor.toUpperCase();
}

int _generateRandomInRange(
    Random random, int value, int minRange, int maxRange) {
  int minValue = max(0, value - minRange);
  int maxValue = min(255, value + maxRange);
  return minValue + random.nextInt(maxValue - minValue + 1);
}

int _hexToR(String hex) {
  return int.parse(hex.substring(0, 2), radix: 16);
}

int _hexToG(String hex) {
  return int.parse(hex.substring(2, 4), radix: 16);
}

int _hexToB(String hex) {
  return int.parse(hex.substring(4, 6), radix: 16);
}

String _rgbToHex(int r, int g, int b) {
  return '#${r.toRadixString(16).padLeft(2, '0')}${g.toRadixString(16).padLeft(2, '0')}${b.toRadixString(16).padLeft(2, '0')}';
}
