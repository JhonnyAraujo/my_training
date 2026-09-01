import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';     
import 'package:integration_test/integration_test.dart'; 
import 'package:my_training/main.dart';                 

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Fluxo completo CRUD de treinos', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Criar um treino'), findsOneWidget);
    expect(find.byType(Card), findsNothing);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    
    await tester.enterText(find.widgetWithText(TextField, 'Nome do treino'), 'Treino de Pernas');
    await tester.enterText(find.widgetWithText(TextField, 'Intervalo'), '45');
    await tester.enterText(find.widgetWithText(TextField, 'Nome do exercicio'), 'Agachamento');

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    await tester.tap(find.widgetWithText(FilledButton, 'Criar'));
    await tester.pumpAndSettle();

    expect(find.text('Treino de Pernas'), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);

    await tester.drag(find.text('Treino de Pernas'), const Offset(-500, 0.0));
    await tester.pumpAndSettle();
    
    expect(find.text('Treino de Pernas'), findsOneWidget);
    expect(find.byType(Card), findsOneWidget);

    await tester.pump(const Duration(seconds: 4));
    await tester.pumpAndSettle();
  });
}