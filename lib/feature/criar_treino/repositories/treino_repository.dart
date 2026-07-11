import 'package:my_training/feature/criar_treino/datasources/treino_local_datasource.dart';
import 'package:my_training/feature/criar_treino/models/treino_model.dart';

class TreinoRepository {
  final TreinoLocalDatasource datasource = TreinoLocalDatasource();

  Future<void> salvarTreino({required List<TreinoModel> treinos}) async {
    await datasource.salvarTreino(treinos: treinos);
  }

  Future<List<TreinoModel>> buscarTreinos() async {
    return await datasource.buscarTreinos();
  }
}
