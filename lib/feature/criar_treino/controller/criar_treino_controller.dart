import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:my_training/core/models/treino_model.dart';
import 'package:my_training/core/repositories/treino_repository.dart';

class CriarTreinoController extends GetxController {
  CriarTreinoController({required this._repository});

  final TextEditingController nomeTreinoController = TextEditingController();
  final TextEditingController intervaloTreinoController = TextEditingController();
  final TextEditingController exercicioTreinoController = TextEditingController();

  @override
  void onClose() {
    nomeTreinoController.dispose();
    intervaloTreinoController.dispose();
    exercicioTreinoController.dispose();
    super.onClose();
  }

  final ITreinoRepository _repository;

  final RxList<String> _exercises = <String>[].obs;
  List<String> get exercises => _exercises;

  Future<void> criarTreino({required String name, required int interval}) async {
      final TreinoModel novoTreino = TreinoModel(
      name: name,
      interval: interval,
      exercises: _exercises,
    );
    final treinos = await _repository.buscarTreinos();
    treinos.add(novoTreino);
    await _repository.salvarTreino(treinos: treinos);
  }

  Future<void> adicionaExercicio({required String nomeExercicio}) async {
    if (nomeExercicio.isEmpty) return;

    _exercises.add(nomeExercicio);
  }
}
