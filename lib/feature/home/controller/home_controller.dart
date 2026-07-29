import 'package:get/get.dart';
import 'package:my_training/core/models/treino_model.dart';
import 'package:my_training/feature/home/repositories/home_repository.dart';

class HomeController extends GetxController {
  HomeController({required this._repository});

  @override
  void onInit() {
    buscarTreino();
    super.onInit();
  }

  final HomeRepository _repository;

  final RxList<TreinoModel> treinos = <TreinoModel>[].obs;

  Future<void> buscarTreino() async {
    final List<TreinoModel> response = await _repository.buscarTreinos();
    treinos.clear();
    treinos.addAll(response);
  }
  
  Future<void> removeTreino({required int id}) async {
    await _repository.removeTreino(id: id);
  }
}
