import 'package:flutter_dropdown_cleanblc/features/home/data/models/place.dart';

class HomeState {
  final bool? isLoading;
  final List<Place>? countries;
  final List<Place>? states;
  final Place? selectedCountry;
  final Place? selectedState;

  HomeState({
    this.isLoading = false,
    this.countries = const [],
    this.states = const [],
    this.selectedCountry,
    this.selectedState,
  });

  HomeState copyWith({
    bool? isLoading,
    List<Place>? countries,
    List<Place>? states,
    Place? selectedCountry,
    Place? selectedState,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      countries: countries ?? this.countries,
      states: states ?? this.states,
      selectedState: selectedState ?? this.selectedState,
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }
}
