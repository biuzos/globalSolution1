import 'package:flutter/material.dart';
import 'package:projeto_gs1/screens/searchPage.dart';
import 'package:projeto_gs1/screens/telaVisu.dart';

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
              'assets/drone1.jpg',
              height: 150,
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
                    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaHistorico()),
      );
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