import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mpc_flutter/src/features/diary/view/view.dart';
import 'package:mpc_flutter/src/widgets/widgets.dart';

void main() {
  testWidgets('Should display text based on input', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);

    String? text;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommentsSection(
            onChanged: (value) => text = value,
          ),
        ),
      ),
    );

    const key = Key('comments-textfield');
    final textFinder = find.byKey(key);

    await tester.enterText(textFinder, 'Hello');

    expect(text, 'Hello');

    tester.binding.window.clearPhysicalSizeTestValue();
  });

  testWidgets('Should header text named "Comments"', (tester) async {
    tester.binding.window.physicalSizeTestValue = const Size(1080, 1920);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: CommentsSection(),
        ),
      ),
    );

    const key = Key('comments-header');

    final textFinder = find.byKey(key);

    expect(textFinder, findsOneWidget);

    expect(tester.widget(textFinder).runtimeType, TitledCard);

    final widget = tester.widget(textFinder) as TitledCard;

    expect(widget.title, 'Comments');

    tester.binding.window.clearPhysicalSizeTestValue();
  });
}
