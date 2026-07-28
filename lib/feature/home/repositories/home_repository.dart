import 'package:my_training/feature/criar_treino/models/treino_model.dart';
import 'package:my_training/feature/home/datasources/home_datasource.dart';

class HomeRepository {
  const HomeRepository({required this.datasource});

  final HomeDatasource datasource;

  Future<List<TreinoModel>> buscarTreinos() async {
    return await datasource.buscarTreinos();
  }

  Future<void> removeTreino({required int id}) async {
    await datasource.removeTreino(id: id);
  }
}