import 'package:get/get.dart';
import 'package:my_training/feature/criar_treino/models/treino_model.dart';
import 'package:my_training/feature/criar_treino/repositories/treino_repository.dart';

class HomeController extends GetxController {
  final TreinoRepository _repository = TreinoRepository();

  final RxList<TreinoModel> treinos = <TreinoModel>[].obs;

  Future<void> buscarTreino() async {
    final List<TreinoModel> response = await _repository.buscarTreinos();
    treinos.clear();
    treinos.addAll(response);
  }
}
