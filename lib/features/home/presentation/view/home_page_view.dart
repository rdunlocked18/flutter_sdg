import 'package:flutter/material.dart';
import 'package:flutter_dropdown_cleanblc/core/common/widgets/custom_dropdown.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/models/place.dart';
import 'package:flutter_dropdown_cleanblc/features/home/providers/home_page_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeState = ref.watch(homePageProvider);
    final viewModel = ref.read(homePageProvider.notifier);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: kToolbarHeight + 20,
        ),
        child: homeState.isLoading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  if (homeState.isLoading == false)
                    CustomDropdown(
                      selectedCountry: homeState.selectedCountry,
                      countries: homeState.countries,
                      onCountryChanged: (Place? newValue) {
                        if (newValue != null) {
                          viewModel.setSelectionCountry(newValue);
                        }
                      },
                    ),
                ],
              ),
      ),
    );
  }
}
