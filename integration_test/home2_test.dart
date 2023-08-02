// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import './../test/step/the_app_initialized.dart';
import './../test/step/the_app_is_running.dart';
import 'package:bdd_widget_test/step/i_wait.dart';
import 'package:bdd_widget_test/step/i_see_text.dart';
import 'package:bdd_widget_test/step/i_tap_text.dart';
import './../test/step/i_waitfivesecond.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('''Home''', () {
    Future<void> bddSetUp(WidgetTester tester) async {
      await theAppInitialized(tester);
      await theAppIsRunning(tester);
    }
    testWidgets('''Press logout button and home navigate''', (tester) async {
      await bddSetUp(tester);
      await iWait(tester);
      await iSeeText(tester, 'Get Started');
      await iTapText(tester, 'Get Started');
      await iWait(tester);
      await iSeeText(tester, 'Extension');
      await iWaitfivesecond(tester);
    });
  });
}
