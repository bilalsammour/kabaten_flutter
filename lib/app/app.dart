import 'package:kabaten/app/configurations.dart';
import 'package:kabaten/app/providers.dart';
import 'package:kabaten/app/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kabaten/generated/l10n.dart';
import 'package:kabaten/view/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: Providers.buildProviders(context),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Configurations.appTitle,
          theme: ThemeManager.theme,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const WelcomeScreen(),
        ),
      );
}
