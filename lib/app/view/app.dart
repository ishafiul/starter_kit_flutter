import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_kit_flutter/app/app_router.dart';
import 'package:starter_kit_flutter/comon/config/bloc_providers.dart';
import 'package:starter_kit_flutter/comon/config/getit_config.dart';
import 'package:starter_kit_flutter/comon/config/theme.dart';
import 'package:starter_kit_flutter/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: getIt<Provider>().providers,
      child: MaterialApp.router(
        theme: getIt<AppTheme>().lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
