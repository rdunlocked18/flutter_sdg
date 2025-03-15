import 'package:flutter/material.dart';
import 'package:flutter_dropdown_cleanblc/core/common/widgets/custom_dropdown.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/models/place.dart';
import 'package:flutter_dropdown_cleanblc/features/home/providers/home_page_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homePageProvider);
    final viewModel = ref.read(homePageProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(5),
          child: Visibility(
              visible: homeState.isLoading == true,
              child: LinearProgressIndicator()),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)?.homeScreenTitle ?? 'Welcome',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            if (homeState.isLoading == false &&
                homeState.countries?.isNotEmpty == true)
              CustomDropdown(
                selectedCountry: homeState.selectedCountry,
                countries: homeState.countries,
                onCountryChanged: (Place? newValue) {
                  if (newValue != null) {
                    viewModel.setSelectionCountry(newValue);
                  }
                },
              ),
            SizedBox(height: 20),
            if (homeState.selectedCountry != null &&
                homeState.isLoading == false)
              CustomDropdown(
                firstElementLabel: 'Select State',
                selectedCountry: homeState.selectedState,
                countries: homeState.states,
                onCountryChanged: (Place? newValue) {
                  if (newValue != null) {
                    viewModel.setSelectionState(newValue);
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
