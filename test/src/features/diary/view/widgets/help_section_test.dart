import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mpc_flutter/src/features/diary/view/view.dart';

void main() {
  testWidgets('Should contain header named "Add to site diary"',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: HelpSection(),
        ),
      ),
    );

    final finder = find.text('Add to site diary');

    expect(finder, findsOneWidget);

    final widget = tester.widget(finder) as Text;

    expect(widget.style?.fontSize, 20.0);
  });

  testWidgets('Should contain icon with Colors.grey color', (tester) async {
    int counter = 0;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: HelpSection(
            onPressed: () => counter++,
          ),
        ),
      ),
    );

    final finder = find.byIcon(Icons.help_outlined);

    expect(finder, findsOneWidget);

    final widget = tester.widget(finder) as Icon;

    expect(widget.color, Colors.grey);

    const buttonKey = Key('help-button');
    final buttonFinder = find.byKey(buttonKey);

    expect(buttonFinder, findsOneWidget);

    await tester.tap(buttonFinder);

    expect(counter, 1);
  });
}
