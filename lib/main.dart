import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mycodingsetup/feature/views/authentication/welcome_view.dart';
import 'package:mycodingsetup/firebase_options.dart';
import 'package:mycodingsetup/product/state/user_context.dart';
import 'package:mycodingsetup/product/utility/app_theme.dart';
import 'package:mycodingsetup/product/utility/project_manager.dart';
import 'package:mycodingsetup/product/utility/translation/translation_manager.dart';
import 'package:mycodingsetup/product/utility/ui_general/system_style.dart';

final class AppInitialize {
  AppInitialize._();
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    /// if you want use for your environment you should uncomment this line
    // await Firebase.initializeApp();

    SystemGeneralStyle.make();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}

Future<void> main() async {
  await AppInitialize.initialize();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return TranslationManager(
      child: UserContext(
        child: Builder(
          builder: (context) {
            return MaterialApp(
              theme: AppTheme().currentTheme,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              scaffoldMessengerKey: ProjectManager.scaffoldMessengerKey,
              home: const WelcomeView(),
            );
          },
        ),
      ),
    );
  }
}
