import 'package:auth_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
    testWidgets(
      'test Text Button',
      (WidgetTester tester)async{
        await  tester.pumpWidget(const MyApp());
        await  tester.tap(find.byType(TextButton));
        await tester.pumpAndSettle();
        expect(find.text('SignIn'), findsNothing);
      }
      );
  
}
