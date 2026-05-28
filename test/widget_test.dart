import 'package:flutter_test/flutter_test.dart';
import 'package:groceries_app/main.dart';

void main() {
  testWidgets('App should build without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const GroceriesApp());
    // التحقق من أن التطبيق يعمل بدون أخطاء
    expect(find.byType(GroceriesApp), findsOneWidget);
  });
}
