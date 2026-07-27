import 'package:my_training/feature/criar_treino/datasources/criar_treino_datasource.dart';
import 'package:my_training/feature/criar_treino/models/treino_model.dart';

class CriarTreinoRepository {
  final CriarTreinoDatasource datasource = CriarTreinoDatasource();

  Future<void> salvarTreino({required List<TreinoModel> treinos}) async {
    await datasource.salvarTreino(treinos: treinos);
  }
}
