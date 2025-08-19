import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/my_home_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Main widget test -', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: MyHomePage(
          title: 'My App',
        ),
      ),
    ));

    final val = find.text('0');
    expect(val, findsOneWidget);

    final val1 = find.text('1');
    expect(val1, findsNothing);

    final val3 = find.text('You have pushed the button this many times:');
    expect(val3, findsOneWidget);

    final floatingAction = find.byType(FloatingActionButton);
    expect(floatingAction, findsOneWidget);
  });
}
