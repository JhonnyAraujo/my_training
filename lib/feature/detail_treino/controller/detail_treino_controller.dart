import 'package:get/get.dart';
import 'package:my_training/core/models/treino_model.dart';
import 'package:my_training/core/repositories/treino_repository.dart';

class DetailTreinoController extends GetxController {
  final ITreinoRepository repository;

  DetailTreinoController({required this.repository});

  final RxBool _isLoading = false.obs;
  RxList<TreinoModel> treinos = <TreinoModel>[].obs;
  Rxn<TreinoModel> treino = Rxn<TreinoModel>();
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();

    final int treinoId = Get.arguments;
    fetchTreino(treinoId);
  }

  Future<void> fetchTreino(int id) async {
    _isLoading.value = true;

    final List<TreinoModel> result = await repository.buscarTreinos();
    treino.value = result.firstWhereOrNull((treino) => treino.id == id);

    _isLoading.value = false;

  }
}