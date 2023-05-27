import 'package:flutter/material.dart';

import 'telaImgDetalhada.dart';


class TelaVisualizacaoImagens extends StatelessWidget {
  String generateImageIdFromCoordinates(String imagePath) {
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

  final Map<String, Map<String, dynamic>> imageDetails = {
    'image1': {
      'location': 'Mato Grosso',
      'crop': 'Soja',
      'area': 10.5,
    },
    'image2': {
      'location': 'São Paulo',
      'crop': 'Milho',
      'area': 8.2,
    },
    'image3': {
      'location': 'Paraná',
      'crop': 'Trigo',
      'area': 6.7,
    },
    'image4': {
      'location': 'Goiás',
      'crop': 'Algodão',
      'area': 12.1,
    },
    // Adicione mais informações de imagem conforme necessário
  };

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
          final Map<String, dynamic> details = imageDetails[imageId] ?? {};
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
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                print('Error loading image: $error');
                return const SizedBox.shrink();
              },
            ),
          );
        },
      ),
    );
  }
}