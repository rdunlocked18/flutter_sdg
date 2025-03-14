import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardProvider = StateNotifierProvider<DashboardViewModel, int>(
    (ref) => DashboardViewModel());

class DashboardViewModel extends StateNotifier<int> {
  DashboardViewModel() : super(0);

  void setNavigatorIndex(int index) {
    state = index;
  }
}
