import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_training/core/models/treino_model.dart';
import 'package:my_training/core/theme/theme.dart';
import 'package:my_training/feature/criar_treino/binding/criar_treino_binding.dart';
import 'package:my_training/feature/criar_treino/pages/criar_treino_page.dart';
import 'package:my_training/feature/home/controller/home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Training', style: display), shape: Border(bottom: BorderSide(color: AppColors.neutral[800]!)),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.largeExtra),
              Text('Seus Treinos', style: tituloLarge,),
              const SizedBox(height: AppDimensions.smallExtra),
              Expanded(
                child: Obx(() {
                  return ListView.separated(
                    itemCount: controller.treinos.length,
                    separatorBuilder: (_, _) => const SizedBox(height: AppDimensions.medium),
                    itemBuilder: (_, index) {
                      TreinoModel treino = controller.treinos[index];
                      return Dismissible(
                        key: ValueKey(treino.id),
                        onDismissed: (_) {
                          try {
                            controller.removeTreino(id: treino.id);
                            Get.snackbar('Sucesso', 'Treino removido com sucesso!');
                          } catch (exception) {
                            Get.snackbar('Error', exception.toString());
                          }  
                        },
                        background: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.error,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.delete, color: AppColors.error[200]),
                              Icon(Icons.delete, color: AppColors.error[200]),
                            ],
                          ),
                        ),

                        child: SizedBox(
                          width: double.infinity,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.neutral[800],
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.neutral[700]!
                              )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(AppDimensions.medium),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: AppDimensions.small,
                                children: [
                                  Text(treino.name, style: tituloMedio),
                                  Text('6 Exercicios', style: body),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.primary,
        onPressed: () async {
          try {
            await Get.to(const CriarTreinoPage(), binding: CriarTreinoBinding());

            controller.buscarTreino();
          } catch (exception) {
            Get.snackbar('Error', exception.toString());
          }
        },
        label: Text('Criar um treino', style: body.copyWith(color: AppColors.neutral[900])),
        icon: Icon(Icons.add, color: AppColors.neutral[900],),
      ),
    );
  }
}
