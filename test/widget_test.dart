// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


import 'package:navigation/main.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {
  void testpush();
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    testpush();
  }
  void testpop();

  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    testpop();
  }

}

class FakeRoute extends Fake implements Route {}

void main() {
  final mockObserver = MockNavigatorObserver();

  testWidgets('Make sure a push occurs', (tester) async {
    // Verify that our counter starts at 0.
    // expect(find.text('First Route'), findsOneWidget);


    await tester.pumpWidget(
      MaterialApp(
        title: 'Navigation Basics',
        home:  FirstRoute(),
        navigatorObservers: [mockObserver],
      ),
    );

    var monboutton = find.byType(ElevatedButton);

    expect(monboutton, findsOneWidget);
    await tester.tap(monboutton);

    await tester.pumpAndSettle();

    verify(mockObserver.testpush());


    var monboutton1 = find.byType(ElevatedButton);

    expect(monboutton1, findsOneWidget);
    await tester.tap(monboutton1);

    await tester.pumpAndSettle();



    verify(mockObserver.testpop());

    // expect(find.text('Open route'), findsOneWidget);
  });

}
