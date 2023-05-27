import 'package:flutter/material.dart';

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
    'image3': 'assets/drone4.jpg',
    'image4': 'assets/drone5.jpg',
  };
  return idToImagePath[id] ?? '';
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sistema de Monitoramento de Plantações'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/drone_1.jpg',
              height: 100,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Bem-vindo ao Sistema de Monitoramento de Plantações',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32.0),
            const Text(
              'Informações Gerais:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text('Número de drones em operação: XX'),
            const Text('Plantações monitoradas: XX'),
            const Text('Última atualização: XX/XX/XXXX'),
            const SizedBox(height: 32.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaVisualizacaoImagens(),
                    ),
                  );
                },
                child: const Text('Visualizar Plantações'),
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Navegar para a tela do mapa de drones
                },
                child: const Text('Mapa de Drones'),
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Navegar para a tela de relatórios e análises
                },
                child: const Text('Relatórios e Análises'),
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // Navegar para a tela de configurações
                },
                child: const Text('Configurações'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
    'assets/drone4.jpg',
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
          return GestureDetector(
            onTap: () { Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaImagemDetalhada(imageId: imageId),
                ),
              );
            },
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
class TelaImagemDetalhada extends StatelessWidget {
  final String imageId;

  const TelaImagemDetalhada({required this.imageId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagem $imageId'),
      ),
      body: Center(
        child: Image.asset(
          getImagePathFromId(imageId),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}