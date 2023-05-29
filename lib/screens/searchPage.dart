import 'package:flutter/material.dart';

// Classe para representar uma imagem e suas informações
class PlantImage {
  final String id;
  final String imagePath;
  final String location;
  final String crop;
  final double area;

  PlantImage({
    required this.id,
    required this.imagePath,
    required this.location,
    required this.crop,
    required this.area,
  });
}

class TelaHistorico extends StatefulWidget {
  @override
  _TelaHistoricoState createState() => _TelaHistoricoState();
}

class _TelaHistoricoState extends State<TelaHistorico> {
  List<PlantImage> images = [
    PlantImage(
      id: 'ID19924394',
      imagePath: 'assets/drone2.jpg',
      location: 'Mato Grosso',
      crop: 'Soja',
      area: 10.5,
    ),
    PlantImage(
      id: 'ID20124381',
      imagePath: 'assets/drone3.jpg',
      location: 'São Paulo',
      crop: 'Milho',
      area: 8.2,
    ),
       PlantImage(
      id: 'ID21364408',
      imagePath: 'assets/drone4.jpeg',
      location: 'Goiás',
      crop: 'Algodão',
      area: 12.1,
    ),
       PlantImage(
      id: 'ID18974312',
      imagePath: 'assets/drone3.jpg',
      location: 'Bahia',
      crop: 'Café',
      area: 5.8,
    ),
    // Adicione mais imagens aqui
  ];

  List<PlantImage> filteredImages = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicialmente, exibe todas as imagens no histórico
    filteredImages = images;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void filterImages(String searchTerm) {
    setState(() {
      if (searchTerm.isEmpty) {
        filteredImages = images;
      } else {
        // Filtra as imagens com base no termo de busca (pode ser ajustado conforme necessário)
        filteredImages = images.where((image) {
          return image.location.toLowerCase().contains(searchTerm.toLowerCase()) ||
              image.crop.toLowerCase().contains(searchTerm.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Imagens'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: filterImages,
              decoration: InputDecoration(
                labelText: 'Buscar',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredImages.length,
              itemBuilder: (context, index) {
                final image = filteredImages[index];
                return ListTile(
                  leading: Image.asset(
                    image.imagePath,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                  title: Text('ID: ${image.id}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Localidade: ${image.location}'),
                      Text('Plantação: ${image.crop}'),
                      Text('Extensão: ${image.area} hectares'),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}