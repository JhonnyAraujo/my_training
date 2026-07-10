import 'package:get/get.dart';
import 'package:my_training/feature/criar_treino/models/treino_model.dart';

class HomeController extends GetxController {
  final RxList<TreinoModel> _treinos = <TreinoModel>[].obs;
  List<TreinoModel> get treinos => _treinos;

  void adicionaTreino({required TreinoModel novoTreino}) {
    _treinos.add(novoTreino);
  }
}
