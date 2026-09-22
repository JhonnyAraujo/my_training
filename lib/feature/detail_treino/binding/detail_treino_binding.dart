import 'package:get/instance_manager.dart';
import 'package:my_training/core/datasources/treino_datasource.dart';
import 'package:my_training/core/repositories/treino_repository.dart';
import 'package:my_training/feature/detail_treino/controller/detail_treino_controller.dart';

class DetailTreinoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ITreinoDatasource>(() => TreinoDatasource());

    Get.lazyPut<ITreinoRepository>(() => TreinoRepository(datasource: Get.find()));

    Get.lazyPut<DetailTreinoController>(() => DetailTreinoController(repository: Get.find()));
  }
}