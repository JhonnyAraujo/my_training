import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_training/feature/criar_treino/controller/criar_treino_controller.dart';

class CriarTreinoPage extends GetView<CriarTreinoController> {
  const CriarTreinoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criar Treino'), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            spacing: 10,
            children: [
              TextField(
                controller: controller.nomeTreinoController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nome do treino',
                  hintText: 'Ex: Treino de costa',
                ),
              ),
              TextField(
                controller: controller.intervaloTreinoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Intervalo',
                  hintText: 'Quantos minutos de intervalo?',
                ),
              ),
              Obx(() {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.exercises.length + 2,
                    itemBuilder: (_, index) {
                      if (index < controller.exercises.length) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 18,
                          ),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            shape: BoxShape.rectangle,
                            border: BoxBorder.all(color: Colors.black54),
                          ),
                          child: Text(controller.exercises[index]),
                        );
                      } else if (index == controller.exercises.length) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextField(
                            controller: controller.exercicioTreinoController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Nome do exercicio',
                              hintText: 'Ex: Flexão',
                            ),
                          ),
                        );
                      } else {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Divider()),
                            IconButton.filled(
                              onPressed: () {
                                controller.adicionaExercicio(
                                  nomeExercicio: controller.exercicioTreinoController.text,
                                );

                                controller.exercicioTreinoController.clear();
                              },
                              icon: Icon(Icons.add),
                            ),
                            Expanded(child: Divider()),
                          ],
                        );
                      }
                    },
                  ),
                );
              }),
              SizedBox(
                height: 62,
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () async {
                    try {
                      await controller.criarTreino(
                        name: controller.nomeTreinoController.text,
                        interval:
                            int.tryParse(controller.intervaloTreinoController.text) ?? 0,
                      );
                  
                      Get.snackbar('Sucesso', 'Treino criado com sucesso!');

                      Get.back();
                    } catch (exception) {
                      Get.snackbar('Error', exception.toString());
                    }
                  },
                  child: Text('Criar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
