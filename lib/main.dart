import 'package:flutter/material.dart';
import 'package:projeto_gs1/screens/homescreen.dart';

void main() {
  runApp(
    MaterialApp(
      home: Directionality(
        textDirection: TextDirection.ltr,
        child: TelaInicial(),
      ),
    ),
  );
}

String getImagePathFromId(String id) {
     Map<String, String> idToImagePath = {
    'image1': 'assets/drone2.jpg',
    'image2': 'assets/drone3.jpg',
    'image3': 'assets/drone4.jpeg',
    'image4': 'assets/drone5.jpg',
  };
  return idToImagePath[id] ?? '';
}
