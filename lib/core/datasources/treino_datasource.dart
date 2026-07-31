import 'dart:convert';

import 'package:my_training/core/models/treino_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ITreinoDatasource {
  Future<List<TreinoModel>> buscarTreinos();
  Future<void> removeTreino({required int id});
  Future<void> salvarTreino({required List<TreinoModel> treinos});
}

class TreinoDatasource implements ITreinoDatasource {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  @override
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

  @override
  Future<void> salvarTreino({required List<TreinoModel> treinos}) async {
    try {
      final jsonList = treinos.map((treino) => treino.toJson()).toList();
      
      await asyncPrefs.setString('treinos', jsonEncode(jsonList));
    } catch (_) {
      throw Exception('Não foi possível criar o treino');
    }
  }

  @override
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