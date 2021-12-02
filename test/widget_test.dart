import 'package:flutter_test/flutter_test.dart';
import 'package:trabalhofinalbd2/main.dart';

void main() {
  testWidgets(
      'Verifica se o widget principal foi carregado com sucesso sem exceções',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(tester.takeException(), null);
  });
}
