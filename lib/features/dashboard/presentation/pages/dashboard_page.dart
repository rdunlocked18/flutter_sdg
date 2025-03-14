import 'package:flutter/material.dart';
import 'package:flutter_dropdown_cleanblc/features/dashboard/provider/dashboard_provider.dart';
import 'package:flutter_dropdown_cleanblc/features/home/presentation/view/home_page_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(dashboardProvider);
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: [
          HomePageView(),
          Center(
            child: Text('Profile'),
          ),
          Center(
            child: Text('Settings'),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          ref.read(dashboardProvider.notifier).setNavigatorIndex(index);
        },
        selectedIndex: index,
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Settings',
          )
        ],
      ),
    );
  }
}
