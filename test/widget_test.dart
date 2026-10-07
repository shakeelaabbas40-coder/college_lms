import 'package:flutter_test/flutter_test.dart';
import 'package:college_lms/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('College LMS'), findsOneWidget);
  });
}
