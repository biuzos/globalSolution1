import 'package:flutter/material.dart';

import 'telaImgDetalhada.dart';

class TelaVisualizacaoImagens extends StatelessWidget {
  static String generateImageIdFromCoordinates(double latitude, double longitude) {
    String latString = latitude.toStringAsFixed(2).replaceAll(RegExp(r'[^\d]'), '');
    String lonString = longitude.toStringAsFixed(2).replaceAll(RegExp(r'[^\d]'), '');
    return 'ID$latString$lonString';
  }

  final List<Map<String, dynamic>> droneImages = [
    {
      'imagePath': 'assets/drone2.jpg',
      'latitude': 19.92,
      'longitude': -43.94,
      'details': {
        'location': 'Mato Grosso',
        'crop': 'Soja',
        'area': 10.5,
      },
    },
    {
      'imagePath': 'assets/drone3.jpg',
      'latitude': 20.12,
      'longitude': -43.81,
      'details': {
        'location': 'São Paulo',
        'crop': 'Milho',
        'area': 8.2,
      },
    },
    {
      'imagePath': 'assets/drone4.jpeg',
      'latitude': 21.36,
      'longitude': -44.08,
      'details': {
        'location': 'Goiás',
        'crop': 'Algodão',
        'area': 12.1,
      },
    },
    {
      'imagePath': 'assets/drone5.jpg',
      'latitude': 18.97,
      'longitude': -43.12,
      'details': {
        'location': 'Bahia',
        'crop': 'Café',
        'area': 5.8,
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualização de Imagens'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: droneImages.length,
        itemBuilder: (context, index) {
          final image = droneImages[index];
          final double latitude = image['latitude'];
          final double longitude = image['longitude'];
          final String imageId = generateImageIdFromCoordinates(latitude, longitude);
          final Map<String, dynamic> details = image['details'];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaImagemDetalhada(
                    imageId: imageId,
                    location: details['location'] ?? '',
                    crop: details['crop'] ?? '',
                    area: details['area'] ?? 0.0,
                  ),
                ),
              );
            },
            child: Center(
              child: Image.asset(
                image['imagePath'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading image: $error');
                  return const SizedBox.shrink();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}