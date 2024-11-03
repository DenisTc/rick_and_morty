import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/src/core/localization/generated/l10n.dart';
import 'package:rick_and_morty/src/core/services/local_storage.dart';
import 'package:rick_and_morty/src/core/theme/app_theme.dart';
import 'package:rick_and_morty/src/feature/characters/presentation/characters_screen.dart';
import 'package:rick_and_morty/src/feature/characters/store/characters_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LocalStorage().init();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<CharactersStore>(create: (_) => CharactersStore()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        home: const CharactersScreen(),
      ),
    );
  }
}
