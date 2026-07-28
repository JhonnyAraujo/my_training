import 'package:get/instance_manager.dart';
import 'package:my_training/feature/criar_treino/controller/criar_treino_controller.dart';
import 'package:my_training/feature/criar_treino/datasources/criar_treino_datasource.dart';
import 'package:my_training/feature/criar_treino/repositories/criar_treino_repository.dart';
import 'package:my_training/feature/home/repositories/home_repository.dart';

class CriarTreinoBinding extends Bindings {
  @override
  void dependencies() {
      Get.lazyPut<CriarTreinoDatasource>(() => CriarTreinoDatasource());

      Get.lazyPut<CriarTreinoRepository>(() => CriarTreinoRepository(datasource: Get.find<CriarTreinoDatasource>()));
      
      Get.lazyPut<CriarTreinoController>(() => CriarTreinoController(repository: Get.find<CriarTreinoRepository>(), homeRepository: Get.find<HomeRepository>()));
  }
}