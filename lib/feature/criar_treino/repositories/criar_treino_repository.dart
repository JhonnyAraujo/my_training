import 'package:my_training/feature/criar_treino/datasources/criar_treino_datasource.dart';
import 'package:my_training/feature/criar_treino/models/treino_model.dart';

class CriarTreinoRepository {
  const CriarTreinoRepository({required this.datasource});
  
  final ICriarTreinoDatasouce datasource;


  Future<void> salvarTreino({required List<TreinoModel> treinos}) async {
    await datasource.salvarTreino(treinos: treinos);
  }
}
