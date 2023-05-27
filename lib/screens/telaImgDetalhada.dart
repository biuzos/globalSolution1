import 'package:flutter/material.dart';


class TelaImagemDetalhada extends StatelessWidget {
  final String imageId;
  final String location;
  final String crop;
  final double area;

  const TelaImagemDetalhada({
    required this.imageId,
    required this.location,
    required this.crop,
    required this.area,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagem $imageId'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            getImagePathFromId(imageId),
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              print('Error loading image: $error');
              return const SizedBox.shrink();
            },
          ),
          const SizedBox(height: 16.0),
          Text('Localidade: $location'),
          Text('Plantação: $crop'),
          Text('Extensão: $area hectares'),
        ],
      ),
    );
  }

  String getImagePathFromId(String id) {
    Map<String, String> idToImagePath = {
      'image1': 'assets/drone2.jpg',
      'image2': 'assets/drone3.jpg',
      'image3': 'assets/drone4.jpeg',
      'image4': 'assets/drone5.jpg',
      // Adicione mais mapeamentos de ID-caminho conforme necessário
    };
    return idToImagePath[id] ?? '';
  }
}