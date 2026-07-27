import 'package:my_training/feature/criar_treino/models/treino_model.dart';
import 'package:my_training/feature/home/datasources/home_datasource.dart';

class HomeRepository {
  final HomeDatasource datasource = HomeDatasource();

  Future<List<TreinoModel>> buscarTreinos() async {
    return await datasource.buscarTreinos();
  }

  Future<void> removeTreino({required int id}) async {
    await datasource.removeTreino(id: id);
  }
}