import 'dart:convert';

import 'package:my_training/feature/criar_treino/models/treino_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TreinoLocalDatasource {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  void salvarTreino({required List<TreinoModel> treinos}) async {
    final jsonList = treinos.map((treino) => treino.toJson()).toList();

    await asyncPrefs.setString('treinos', jsonEncode(jsonList));
  }

  Future<List<TreinoModel>> buscarTreinos() async {
    final jsonString = await asyncPrefs.getString('treinos');
    if (jsonString == null) return [];

    final decoded = jsonDecode(jsonString) as List;
    return decoded.map((elemento) => TreinoModel.fromJson(elemento)).toList();
  }
}
