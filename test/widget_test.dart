import 'package:flutter_test/flutter_test.dart';

import 'package:untitled/main.dart';

void main() {
  testWidgets('She Shield app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SheShieldApp());

    // Verify that She Shield title or welcome screen is present.
    expect(find.text('She Shield'), findsWidgets);
  });
}
