import 'package:flutter_dropdown_cleanblc/features/home/data/models/place.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/respository/home_repository.dart';
import 'package:flutter_dropdown_cleanblc/features/home/presentation/state/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageViewModel extends StateNotifier<HomeState> {
  final HomeRepository repository;
  HomePageViewModel({required this.repository}) : super(HomeState()) {
    init();
  }

  /// Initial Method to call to APIS & set entry state.
  Future<void> init() async {
    state = state.copyWith(isLoading: true);
    var result = await repository.getCountries();
    state = state.copyWith(isLoading: false, countries: result);
  }

  /// Initial Method to setSelection on country
  /// Once country is selected call getStates using [selectCountry.id].
  Future<void> setSelectionCountry(Place selectCountry) async {
    state = state.copyWith(
      selectedCountry: selectCountry,
      isLoading: true,
    );
    //
    var stateResult =
        await repository.getStatesForCountry(selectCountry.id ?? 0);

    state = state.copyWith(
      isLoading: false,
      states: stateResult,
      selectedState: Place(),
      selectedCountry: selectCountry,
    );
  }

  /// Sets selection on State.
  Future<void> setSelectionState(Place selectedState) async {
    state = state.copyWith(selectedState: selectedState);
  }
}
