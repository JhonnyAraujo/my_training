import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_training/core/repositories/treino_repository.dart';
import 'package:my_training/feature/criar_treino/controller/criar_treino_controller.dart';

class MockTreinoRepository extends Mock implements ITreinoRepository {}

void main() {
  late MockTreinoRepository mockRepository;
  late CriarTreinoController controller;

  setUp(() {
    mockRepository = MockTreinoRepository();
    controller = CriarTreinoController(repository: mockRepository);
  });

  group('CriarTreinoController -', () {
    test('deve adicionar um exercicio na lista de exercicios quando o nome for valido', () {
      //Arrange

      //Act
      controller.adicionaExercicio(nomeExercicio: 'Flexao');

      //Assert
      expect(controller.exercises[0], 'Flexao');
    });

    test('deve chamar o repository para salvar o treino criado', () async {
      //Arrange
      when(() => mockRepository.buscarTreinos()).thenAnswer((_) async => []);
      when(() => mockRepository.salvarTreino(treinos: any(named: 'treinos'))).thenAnswer((_) async => {});

      //Act
      controller.adicionaExercicio(nomeExercicio: 'Flexao');
      await controller.criarTreino(name: 'Treino A', interval: 60);

      //Assert
      verify(() => mockRepository.salvarTreino(treinos: any(named: 'treinos'))).called(1);
    });
  });
}