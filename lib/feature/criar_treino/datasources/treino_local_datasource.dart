import 'dart:convert';

import 'package:my_training/feature/criar_treino/models/treino_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TreinoLocalDatasource {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  Future<void> salvarTreino({required List<TreinoModel> treinos}) async {
    try {
      final jsonList = treinos.map((treino) => treino.toJson()).toList();
      await asyncPrefs.setString('treinos', jsonEncode(jsonList));
    } catch (_) {
      throw Exception('Não foi possível salvar o treino');
    }
  }

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

      await salvarTreino(treinos: treinos);
    } catch (_) {
      throw Exception('Não foi possível remover o treino');
    }
    
  }
} 
