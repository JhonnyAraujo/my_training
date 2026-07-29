import 'package:my_training/core/models/treino_model.dart';
import 'package:my_training/core/datasources/treino_datasource.dart';

abstract class ITreinoRepository {
  Future<List<TreinoModel>> buscarTreinos();
  Future<void> salvarTreino({required List<TreinoModel> treinos});
  Future<void> removeTreino({required int id});
}

class TreinoRepository implements ITreinoRepository{
  const TreinoRepository({required this.datasource});
  final TreinoDatasource datasource;

  @override
  Future<List<TreinoModel>> buscarTreinos() async {
    return await datasource.buscarTreinos();
  }

  @override
  Future<void> salvarTreino({required List<TreinoModel> treinos}) async {
    await datasource.salvarTreino(treinos: treinos);
  }

  @override
  Future<void> removeTreino({required int id}) async {
    await datasource.removeTreino(id: id);
  }
}