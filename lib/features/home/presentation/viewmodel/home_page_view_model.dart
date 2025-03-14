import 'package:flutter_dropdown_cleanblc/features/home/data/models/place.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/respository/home_repository.dart';
import 'package:flutter_dropdown_cleanblc/features/home/presentation/state/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePageViewModel extends StateNotifier<HomeState> {
  final HomeRepository repository;
  HomePageViewModel({required this.repository}) : super(HomeState()) {
    init();
  }

  void init() async {
    state = state.copyWith(isLoading: true);
    var result = await repository.getCountries();
    state = state.copyWith(isLoading: false, countries: result);
  }

  void setSelectionCountry(Place selectCountry) {
    state = state.copyWith(selectedCountry: selectCountry);
  }
}
