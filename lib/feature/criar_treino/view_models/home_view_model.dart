import 'package:mobx/mobx.dart';
import 'package:my_training/feature/criar_treino/models/treino_model.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  @observable
  // ignore: prefer_final_fields
  ObservableList<TreinoModel> _treinos = <TreinoModel>[].asObservable();
  ObservableList get treinos => _treinos;

  @action
  void adicionaTreino() {
    _treinos.add(
      TreinoModel(name: 'Treino 1', interval: 60, exercises: List.empty()),
    );
  }
}
