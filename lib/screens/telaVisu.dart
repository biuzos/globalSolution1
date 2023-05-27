import 'package:flutter/material.dart';

import '../main.dart';


class TelaVisualizacaoImagens extends StatelessWidget {
  String generateImageIdFromCoordinates(String imagePath) {
    // Example implementation: Generating ID from the last two segments of the image path
    final pathSegments = imagePath.split('/');
    final imageName = pathSegments.last;
    final id = imageName.substring(0, imageName.indexOf('.'));
    return id;
  }
  final List<String> droneImages = [
    'assets/drone2.jpg',
    'assets/drone3.jpg',
    'assets/drone4.jpeg',
    'assets/drone5.jpg',
    // Adicione mais imagens aqui
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
          final imageId = generateImageIdFromCoordinates(image);
          child: Image.asset(
              image,
              fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}