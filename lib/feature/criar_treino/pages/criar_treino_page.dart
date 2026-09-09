import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_training/core/theme/app_colors.dart';
import 'package:my_training/core/theme/app_dimensions.dart';
import 'package:my_training/core/theme/app_typography.dart';
import 'package:my_training/feature/criar_treino/controller/criar_treino_controller.dart';

class CriarTreinoPage extends GetView<CriarTreinoController> {
  const CriarTreinoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Criar Treino', style: headline),
        centerTitle: true,
        shape: Border(bottom: BorderSide(color: AppColors.neutral[800]!)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.medium),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.largeExtra),
              TextField(
                controller: controller.nomeTreinoController,
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  labelText: 'Nome do treino',
                  labelStyle: label,
                  hintText: 'Ex: Treino de costa',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              TextField(
                controller: controller.intervaloTreinoController,
                keyboardType: TextInputType.number,
                cursorColor: AppColors.primary,
                decoration: InputDecoration(
                  labelText: 'Intervalo',
                  labelStyle: label,
                  hintText: 'Quantos minutos de intervalo?',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: AppColors.primary),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 2.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppDimensions.medium),
              Text('Exercícios', style: tituloLarge),
              Obx(() {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.exercises.length + 2,
                    itemBuilder: (_, index) {
                      if (index < controller.exercises.length) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                            side: BorderSide(color: AppColors.neutral[700]!),
                          ),
                          margin: const EdgeInsets.only(bottom: 10.0),

                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppDimensions.medium,
                              vertical: AppDimensions.smallExtra,
                            ),
                            child: Text(
                              controller.exercises[index],
                              style: body,
                            ),
                          ),
                        );
                      } else if (index == controller.exercises.length) {
                        return Card(
                          margin: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              topRight: Radius.circular(8.0),
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                              border: Border(
                                left: BorderSide(
                                  color: AppColors.neutral[700]!,
                                ),
                                top: BorderSide(color: AppColors.neutral[700]!),
                                right: BorderSide(
                                  color: AppColors.neutral[700]!,
                                ),
                              ),
                            ),
                            padding: EdgeInsets.all(AppDimensions.medium),
                            child: TextField(
                              controller: controller.exercicioTreinoController,
                              cursorColor: AppColors.primary,
                              decoration: InputDecoration(
                                labelText: 'Nome do exercício',
                                labelStyle: label,
                                hintText: 'Ex: Flexão',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return Card(
                          margin: EdgeInsets.zero,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                              ),
                              border: Border(
                                left: BorderSide(
                                  color: AppColors.neutral[700]!,
                                ),
                                bottom: BorderSide(
                                  color: AppColors.neutral[700]!,
                                ),
                                right: BorderSide(
                                  color: AppColors.neutral[700]!,
                                ),
                              ),
                            ),
                            padding: EdgeInsets.all(AppDimensions.medium),
                            child: IconButton.filled(
                              onPressed: () {
                                controller.adicionaExercicio(
                                  nomeExercicio:
                                      controller.exercicioTreinoController.text,
                                );

                                controller.exercicioTreinoController.clear();
                              },
                              style: IconButton.styleFrom(
                                shape: const CircleBorder(),
                                backgroundColor: AppColors.primary,
                              ),
                              iconSize: 46,
                              icon: Icon(Icons.add),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              }),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    try {
                      await controller.criarTreino(
                        name: controller.nomeTreinoController.text,
                        interval:
                            int.tryParse(
                              controller.intervaloTreinoController.text,
                            ) ??
                            0,
                      );
                
                      Get.back();
                
                      Get.snackbar('Sucesso', 'Treino criado com sucesso!');
                    } catch (exception) {
                      Get.snackbar('Error', exception.toString());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: AppDimensions.mediumExtra),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.smallExtra,
                      ),
                    ),
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.neutral[900]
                  ),
                  label: Text('Criar', style: tituloLarge.copyWith(color: AppColors.neutral[900]),),
                  icon: Icon(Icons.check_circle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
