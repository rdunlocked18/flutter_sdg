import 'package:flutter_dropdown_cleanblc/features/home/data/models/place.dart';

class HomeState {
  final bool? isLoading;
  final List<Place>? countries;
  final List<Place>? cities;
  final Place? selectedCountry;
  final Place? selectedCity;

  HomeState({
    this.isLoading = false,
    this.countries = const [],
    this.cities = const [],
    this.selectedCountry,
    this.selectedCity,
  });

  HomeState copyWith({
    bool? isLoading,
    List<Place>? countries,
    List<Place>? cities,
    Place? selectedCountry,
    Place? selectedCity,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      countries: countries ?? this.countries,
      cities: cities ?? this.cities,
      selectedCity: selectedCity ?? this.selectedCity,
      selectedCountry: selectedCountry ?? this.selectedCountry,
    );
  }
}
