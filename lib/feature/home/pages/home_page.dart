import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_training/core/models/treino_model.dart';
import 'package:my_training/feature/criar_treino/pages/criar_treino_page.dart';
import 'package:my_training/feature/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(() {
            return ListView.builder(
              itemCount: controller.treinos.length,
              itemBuilder: (_, index) {
                TreinoModel treino = controller.treinos[index];
                return Dismissible(
                  key: ValueKey(treino.id),
                  onDismissed: (_) {
                    try {
                      controller.removeTreino(id: treino.id);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Treino removido com sucesso!')));
                    } catch (exception) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(exception.toString())));
                    }
                  },
                  background: Container(
                    color: Colors.red,
                    child: Icon(Icons.remove),
                  ),

                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Text(treino.name, textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          try {
            await Get.to(const CriarTreinoPage());

            controller.buscarTreino();
          } catch (exception) {
            Get.snackbar('Error', exception.toString());
          }
        },
        label: const Text('Criar um treino'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
