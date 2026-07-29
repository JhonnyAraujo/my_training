import 'package:get/instance_manager.dart';
import 'package:my_training/feature/home/controller/home_controller.dart';
import 'package:my_training/core/datasources/treino_datasource.dart';
import 'package:my_training/core/repositories/treino_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TreinoDatasource>(() => TreinoDatasource());

    Get.lazyPut<TreinoRepository>(() => TreinoRepository(datasource: Get.find<TreinoDatasource>()));

    Get.lazyPut<HomeController>(() => HomeController(repository: Get.find<TreinoRepository>()));
  }
}