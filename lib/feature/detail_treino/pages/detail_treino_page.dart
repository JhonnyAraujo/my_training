import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_training/core/theme/app_colors.dart';
import 'package:my_training/core/theme/app_dimensions.dart';
import 'package:my_training/core/theme/app_typography.dart';
import 'package:my_training/feature/detail_treino/controller/detail_treino_controller.dart';

class DetailTreinoPage extends GetView<DetailTreinoController> {
  const DetailTreinoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Treino de Peito', style: headline),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.edit))],
        actionsPadding: const EdgeInsets.only(right: 16.0),
        shape: Border(bottom: BorderSide(color: AppColors.neutral[800]!)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.symmetric(
            horizontal: AppDimensions.medium,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppDimensions.largeExtra),
              Text('Exercícios', style: tituloLarge),
              const SizedBox(height: AppDimensions.smallExtra),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Obx(() {
                        final treino = controller.treino.value;
                        return ListView.separated(
                          separatorBuilder:
                              (BuildContext context, int index) =>
                                  const SizedBox(height: 10.0),
                          itemCount: treino!.exercises.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Expanded(
                              child: Column(
                                spacing: 10.0,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Card(
                                      key: const Key('card_exercices'),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        side: BorderSide(
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: AppDimensions.medium,
                                          vertical: AppDimensions.mediumExtra,
                                        ),
                                        child: Text(
                                          treino.exercises[index],
                                          style: body,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    key: const Key('card_interval'),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                      side: BorderSide(
                                        color: AppColors.neutral[700]!,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: AppDimensions.medium,
                                        vertical: AppDimensions.mediumExtra,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        spacing: AppDimensions.smallExtra,
                                        children: [
                                          Icon(
                                            Icons.alarm,
                                            color: AppColors.primary,
                                            size: 17.0,
                                          ),
                                          Text(
                                            '1 min',
                                            style: body.copyWith(
                                              color: AppColors.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
