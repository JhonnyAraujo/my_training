import 'package:get/get.dart';
import 'package:my_training/core/models/treino_model.dart';
import 'package:my_training/core/repositories/treino_repository.dart';

class HomeController extends GetxController {
  HomeController({required this._repository});

  final ITreinoRepository _repository;

  final RxList<TreinoModel> treinos = <TreinoModel>[].obs;

  @override
  void onInit() {
    buscarTreino();
    super.onInit();
  }

  Future<void> buscarTreino() async {
    final List<TreinoModel> response = await _repository.buscarTreinos();

    treinos.clear();
    
    treinos.addAll(response);
  }
  
  Future<void> removeTreino({required int id}) async {
    await _repository.removeTreino(id: id);
  }
}
