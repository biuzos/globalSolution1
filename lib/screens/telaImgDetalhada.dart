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

  String getImagePathFromId(String id) {
    Map<String, String> idToImagePath = {
      'ID19924394': 'assets/drone2.jpg',
      'ID20124381': 'assets/drone3.jpg',
      'ID21364408': 'assets/drone4.jpeg',
      'ID18974312': 'assets/drone5.jpg',
      // Adicione mais mapeamentos de ID para caminho de arquivo conforme necessário
    };
    return idToImagePath[id] ?? '';
  }


  @override
  Widget build(BuildContext context) {
    String imagePath = getImagePathFromId(imageId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Imagem $imageId'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
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
}