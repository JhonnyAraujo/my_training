import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:my_training/feature/criar_treino/models/treino_model.dart';
import 'package:my_training/feature/criar_treino/controller/home_controller.dart';
import 'package:my_training/feature/criar_treino/pages/criar_treino_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = HomeController();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return ListView.builder(
              itemCount: controller.treinos.length,
              itemBuilder: (_, index) {
                TreinoModel treino = controller.treinos[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Text(treino.name, textAlign: TextAlign.center),
                  ),
                );
              },
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          TreinoModel novoTreino = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => CriarTreinoPage()),
          );
          controller.adicionaTreino(novoTreino: novoTreino);
        },
        label: const Text('Criar um treino'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
