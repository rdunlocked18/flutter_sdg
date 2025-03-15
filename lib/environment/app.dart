import 'package:flutter/material.dart';
import 'package:flutter_dropdown_cleanblc/core/resources/locale_provider.dart';
import 'package:flutter_dropdown_cleanblc/core/resources/theme_manager.dart';
import 'package:flutter_dropdown_cleanblc/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themesProvider);
    final locale = ref.watch(localeProvider);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: supportedLocales.values.toList(),
      locale: locale,
      title: AppLocalizations.of(context)?.appName ?? 'SDG Task',
      theme: ThemeManager.lightTheme,
      darkTheme: ThemeManager.darkTheme,
      themeMode: themeModeState,
      home: DashboardPage(),
    );
  }
}
