import 'package:get/instance_manager.dart';
import 'package:my_training/core/datasources/treino_datasource.dart';
import 'package:my_training/feature/criar_treino/controller/criar_treino_controller.dart';
import 'package:my_training/core/repositories/treino_repository.dart';

class CriarTreinoBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<TreinoDatasource>(() => TreinoDatasource());

      Get.lazyPut<TreinoRepository>(() => TreinoRepository(datasource: Get.find<TreinoDatasource>()));
      
      Get.lazyPut<CriarTreinoController>(() => CriarTreinoController(repository: Get.find<TreinoRepository>()));
  }
}