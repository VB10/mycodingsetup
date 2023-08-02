import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mycodingsetup/index.dart';
import 'package:mycodingsetup/product/constants/page_keys.dart';
import 'package:mycodingsetup/product/utility/translation/locale_keys.g.dart';
import 'package:patrol/patrol.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('tap on the floating action button, verify counter',
        (tester) async {
      await AppInitialize.initialize();
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();
      expect(
        find.text(LocaleKeys.authentication_welcome_getStarted.tr()),
        findsOneWidget,
      );

      final withoutLoginButton =
          find.byKey(PageKeyValues.welcomeWithoutLogin.currentKey);
      await tester.tap(withoutLoginButton);
      await tester.pumpAndSettle();
      expect(find.text(LocaleKeys.button_extension.tr()), findsOneWidget);
      await tester.pumpAndSettle(const Duration(seconds: 5));
    });

    patrolTest(
      'logs in successfully',
      ($) async {
        await AppInitialize.initialize();
        await $.pumpWidgetAndSettle(const MyApp());
        expect(
          $(LocaleKeys.authentication_welcome_getStarted.tr()),
          findsOneWidget,
        );
        await $(#welcomeWithoutLogin).tap();
        await $.pumpAndSettle();
        expect($('Extension'), findsOneWidget);
        await $.pumpAndSettle(duration: const Duration(seconds: 5));
      },
    );
  });
}
