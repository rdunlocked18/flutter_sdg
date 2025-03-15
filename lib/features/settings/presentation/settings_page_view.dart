import 'package:flutter/material.dart';
import 'package:flutter_dropdown_cleanblc/core/resources/locale_provider.dart';
import 'package:flutter_dropdown_cleanblc/core/resources/theme_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPageView extends ConsumerWidget {
  const SettingsPageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeProvider = ref.read(themesProvider.notifier);
    var themeMode = ref.read(themesProvider);
    final currentLocale = ref.watch(localeProvider);
    final localeModel = ref.read(localeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            dense: true,
            visualDensity: VisualDensity.comfortable,
            title: Text('Change Theme'),
            subtitle: Text('Active Theme > ${themeMode?.name}'),
            value: themeMode == ThemeMode.dark,
            onChanged: (value) {
              themeProvider.changeTheme(value);
            },
          ),
          SwitchListTile(
            dense: true,
            visualDensity: VisualDensity.comfortable,
            title: Text('Change Locale'),
            subtitle: Text('Active Locale > ${currentLocale.languageCode}'),
            value: currentLocale.languageCode == 'en',
            onChanged: (bool value) {
              localeModel.setLocale(value ? 'en' : 'es');
            },
          )
        ],
      ),
    );
  }
}
