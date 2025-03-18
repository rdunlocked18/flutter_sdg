import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/models/place.dart';
import 'package:flutter_dropdown_cleanblc/features/home/presentation/state/home_state.dart';

void main() {
  group('HomeState TESTS', () {
    final mockCountries = [Place(id: 1, value: 'USA')];
    final mockStates = [Place(id: 101, value: 'California')];

    test('copyWith() should correctly update values', () {
      final initialState = HomeState();
      final newState = initialState.copyWith(
        isLoading: true,
        countries: mockCountries,
        states: mockStates,
        selectedCountry: mockCountries.first,
        selectedState: mockStates.first,
      );

      expect(newState.isLoading, true);
      expect(newState.countries, mockCountries);
      expect(newState.states, mockStates);
      expect(newState.selectedCountry, mockCountries.first);
      expect(newState.selectedState, mockStates.first);
    });

    test('copyWith() should return back previous values if not provided', () {
      final initialState = HomeState(isLoading: true, countries: mockCountries);
      final newState = initialState.copyWith(states: mockStates);

      expect(newState.isLoading, true);
      expect(newState.countries, mockCountries);
      expect(newState.states, mockStates);
    });
  });
}
