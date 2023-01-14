import 'package:beamer/beamer.dart'
    show BeamerBackButtonDispatcher, BeamerParser, BeamerProvider;
import 'package:flutter/material.dart'
    show BuildContext, MaterialApp, Widget;
import 'package:flutter_gen/gen_l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'beamer_routes.dart';
import 'constants/constants.dart';
import 'localization/loalization.dart';
import 'modules/setting/model/setting.model.dart';
import 'theme/themes/dark/dark.theme.dart';
import 'theme/themes/light/light.theme.dart';
import 'theme/themes/themes.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    t = AppLocalizations.of(context);
    final locales = ref.watch(localeConfigProvider);
    final themes = ref.watch(themeConfigProvider);
    return BeamerProvider(
      routerDelegate: routerDelegate,
      child: MaterialApp.router(
        title: appTitle,
        restorationScopeId: appName,
        routerDelegate: routerDelegate,
        onGenerateTitle: onGenerateTitle,
        debugShowCheckedModeBanner: false,
        supportedLocales: supportedLocales,
        routeInformationParser: BeamerParser(),
        localizationsDelegates: localizationsDelegates,
        theme: themes == Themes.light ? lightTheme : darkTheme,
        locale: locales == Locales.english ? enLocale : bnLocale,
        backButtonDispatcher: BeamerBackButtonDispatcher(delegate: routerDelegate),
      ),
    );
  }
}
