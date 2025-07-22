import 'package:abstracta_ivo/app/theme/app_styles.dart';
import 'package:abstracta_ivo/features/features.dart';
import 'package:abstracta_ivo/l10n/arb/app_localizations.dart';
import 'package:abstracta_repository/abstracta_repository.dart';
import 'package:abstracta_repository/i_abstracta_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_service/gemini_service.dart';
import 'package:gemini_service/i_gemini_service.dart';
import 'package:local_storage_service/local_storage_service.dart';

class App extends StatelessWidget {
  const App({
    required this.localStorageService,
    super.key,
  });

  final LocalStorageService localStorageService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppStyles.appTheme,
      darkTheme: AppStyles.appDarkTheme,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => LocalStorageService(),
          ),
          RepositoryProvider<IGeminiService>(
            create: (context) => const GeminiService(),
          ),
          RepositoryProvider<IAbstractaRepository>(
            create: (context) => AbstractaRepository(
              geminiService: context.read(),
              localStorageService: localStorageService,
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => TasksBloc(
                abstractaRepository: context.read(),
              ),
            ),
            BlocProvider(
              create: (context) => TaskActionBloc(
                abstractaRepository: context.read(),
              ),
            ),
            BlocProvider(
              create: (context) => StatisticsBloc(
                abstractaRepository: context.read(),
              ),
            ),
          ],
          child: const HomePage(),
        ),
      ),
    );
  }
}
