import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mpc_flutter/src/features/diary/view/view.dart';
import 'package:mpc_flutter/src/widgets/widgets.dart';

void main() {
  testWidgets('Should contain a header named "Details"', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DetailsSection(),
        ),
      ),
    );

    const key = Key('details-header');

    final finder = find.byKey(key);

    expect(tester.widget(finder).runtimeType, TitledCard);

    final widget = tester.widget(finder) as TitledCard;

    expect(widget.title, 'Details');
  });

  testWidgets('Should contain a TextField with dropdown for date',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DetailsSection(),
        ),
      ),
    );

    const key = Key('date-field');

    final finder = find.byKey(key);

    expect(tester.widget(finder).runtimeType, TextField);

    final widget = tester.widget(finder) as TextField;

    expect(widget.readOnly, true);
    expect(widget.decoration?.hintText, '2020-06-29');
  });

  testWidgets('Should contain a TextField with dropdown for area',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DetailsSection(),
        ),
      ),
    );

    const key = Key('area-field');

    final finder = find.byKey(key);

    expect(tester.widget(finder).runtimeType, TextField);

    final widget = tester.widget(finder) as TextField;

    expect(widget.readOnly, true);
    expect(widget.decoration?.hintText, 'Select Area');
  });

  testWidgets('Should contain a TextField with dropdown for task',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DetailsSection(),
        ),
      ),
    );

    const key = Key('task-field');

    final finder = find.byKey(key);

    expect(tester.widget(finder).runtimeType, TextField);

    final widget = tester.widget(finder) as TextField;

    expect(widget.readOnly, true);
    expect(widget.decoration?.hintText, 'Task Category');
  });

  testWidgets('Should contain a TextField with for tags', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: DetailsSection(),
        ),
      ),
    );

    const key = Key('tags-field');

    final finder = find.byKey(key);

    expect(tester.widget(finder).runtimeType, TextField);

    final widget = tester.widget(finder) as TextField;

    expect(widget.readOnly, false);
    expect(widget.decoration?.hintText, 'Tags');

    await tester.enterText(finder, 'Tagging');

    expect(find.text('Tagging'), findsOneWidget);
  });
}
