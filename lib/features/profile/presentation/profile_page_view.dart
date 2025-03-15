import 'package:flutter/material.dart';
import 'package:flutter_dropdown_cleanblc/core/resources/app_constants.dart';
import 'package:flutter_dropdown_cleanblc/features/home/providers/home_page_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePageView extends ConsumerWidget {
  const ProfilePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var homeState = ref.watch(homePageProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                AppConstants.profileDefaultImageUrl,
              ),
              radius: 60,
            ),
            SizedBox(height: 30),
            Text(
              'Hi Rohit!',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${AppLocalizations.of(context)?.country}: ',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  homeState.selectedCountry?.value ??
                      '${AppLocalizations.of(context)?.noCountrySelected}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${AppLocalizations.of(context)?.state}: ',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  homeState.selectedState?.value ??
                      '${AppLocalizations.of(context)?.noStateSelected}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
