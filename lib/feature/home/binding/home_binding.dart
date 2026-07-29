import 'package:get/instance_manager.dart';
import 'package:my_training/feature/home/controller/home_controller.dart';
import 'package:my_training/feature/home/datasources/home_datasource.dart';
import 'package:my_training/feature/home/repositories/home_repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeDatasource>(() => HomeDatasource());

    Get.lazyPut<HomeRepository>(() => HomeRepository(datasource: Get.find<HomeDatasource>()));

    Get.lazyPut<HomeController>(() => HomeController(repository: Get.find<HomeRepository>()));
  }
}