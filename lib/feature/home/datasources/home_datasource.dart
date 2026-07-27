import 'dart:convert';

import 'package:my_training/feature/criar_treino/datasources/criar_treino_datasource.dart';
import 'package:my_training/feature/criar_treino/models/treino_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeDatasource {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();
  final CriarTreinoDatasource criarTreino = CriarTreinoDatasource();

  Future<List<TreinoModel>> buscarTreinos() async {
    try {
      final jsonString = await asyncPrefs.getString('treinos');
      if (jsonString == null) return [];

      final decoded = jsonDecode(jsonString) as List;
      return decoded.map((elemento) => TreinoModel.fromJson(elemento)).toList();
    } catch (_) {
      throw Exception('Não foi possível buscar o treino');
    }
    
  }

  Future<void> removeTreino({required int id}) async {
    try {
      final treinos = await buscarTreinos();

      treinos.removeWhere((treino) => treino.id == id);

      await criarTreino.salvarTreino(treinos: treinos);
    } catch (_) {
      throw Exception('Não foi possível remover o treino');
    }
    
  }
}