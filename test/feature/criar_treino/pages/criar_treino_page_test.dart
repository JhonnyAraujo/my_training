import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_training/core/repositories/treino_repository.dart';
import 'package:my_training/feature/criar_treino/controller/criar_treino_controller.dart';
import 'package:my_training/feature/criar_treino/pages/criar_treino_page.dart';

class MockTreinoRepository extends Mock implements ITreinoRepository {}

void main() {
  late MockTreinoRepository mockTreinoRepository;

  setUp(() {
    mockTreinoRepository = MockTreinoRepository();
    Get.put(CriarTreinoController(repository: mockTreinoRepository));
  });

  tearDown(() {
    Get.reset();
  });

  group('CriarTreinoPage Widget Tests -', () {
    testWidgets('deve exibir o titulo, campos e o botao de criar na tela', (WidgetTester tester) async {
      // Arrange
        await tester.pumpWidget(
          const GetMaterialApp(
            home: CriarTreinoPage(),
          )
        );

      // Act
      
      // Assert
        expect(find.text('Criar Treino'), findsOneWidget);
        expect(find.text('Nome do treino'), findsOneWidget);
        expect(find.text('Intervalo'), findsOneWidget);
        expect(find.text('Nome do exercicio'), findsOneWidget);
        expect(find.byIcon(Icons.add), findsOneWidget);
        expect(find.widgetWithText(FilledButton, 'Criar'), findsOneWidget);
    });

    testWidgets('deve adicionar um exercicio na lista quando o usuario digitar e clicar em adicionar', (WidgetTester tester) async {
      // Arrange
        await tester.pumpWidget(
          const GetMaterialApp(
            home: CriarTreinoPage(),
          )
        );

      // Act
        await tester.enterText(find.widgetWithText(TextField, 'Nome do exercicio'), 'Flexão');
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();

      // Assert
        expect(find.text('Flexão'), findsOneWidget);

    });

    testWidgets('deve  preencher o formulario e salvar o treino ao clicar em Criar', (WidgetTester tester) async {
      // Arrange  
        when(() => mockTreinoRepository.buscarTreinos()).thenAnswer((_) async => []);
        when(() => mockTreinoRepository.salvarTreino(treinos: any(named: 'treinos'))).thenAnswer((_) async => {});

        await tester.pumpWidget(
          const GetMaterialApp(
            home: CriarTreinoPage(),
          )
        );

      // Act
        await tester.enterText(find.widgetWithText(TextField, 'Nome do treino'), 'Treino A');
        await tester.enterText(find.widgetWithText(TextField, 'Intervalo'), '60');
        await tester.enterText(find.widgetWithText(TextField, 'Nome do exercicio'), 'Flexão');
        await tester.tap(find.byIcon(Icons.add));
        await tester.pumpAndSettle();
        await tester.tap(find.widgetWithText(FilledButton, 'Criar'));
        await tester.pumpAndSettle();

      // Assert
        verify(() => mockTreinoRepository.salvarTreino(treinos: any(named: 'treinos'))).called(1);

      // Avança o relógio virtual 4 segundos para o SnackBar fechar sozinho:
        await tester.pump(const Duration(seconds: 4));
        await tester.pumpAndSettle();
    });
  });
}