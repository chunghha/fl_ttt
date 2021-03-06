// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:fl_ttt/main.dart';

void main() {
  testWidgets('Tic Tac Toe creation test', (tester) async {
    // Build our app.
    await tester.pumpWidget(
      ProviderScope(
        child: TicTacToe(),
      ),
    );

    // Verify that our tic tac toe created.
    expect(find.text('Tic Tac Toe'), findsOneWidget);
  });
}
