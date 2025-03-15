import 'package:dio/dio.dart';
import 'package:flutter_dropdown_cleanblc/core/network/network_client.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/datasources/home_remote_datasource.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/respository/home_repository.dart';
import 'package:flutter_dropdown_cleanblc/features/home/presentation/state/home_state.dart';
import 'package:flutter_dropdown_cleanblc/features/home/presentation/viewmodel/home_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Basic network client Provider
final networkClientProvider = Provider(
  (ref) => NetworkClient(
    Dio(),
  ),
);

// Remote datasource provider
final homeRemoteDatasourceProvider = Provider<HomeRemoteDatasource>((ref) {
  var client = ref.read(networkClientProvider);
  return HomeRemoteDatasourceImpl(networkClient: client);
});

// Home Repository Provider to Provide datasources & clients to repo
final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final remoteDatasource = ref.read(homeRemoteDatasourceProvider);
  return HomeRepository(remoteDatasource: remoteDatasource);
});

// Home State provider which will provide a notifier to mutate state & read state
final homePageProvider =
    StateNotifierProvider<HomePageViewModel, HomeState>((ref) {
  final repo = ref.read(homeRepositoryProvider);
  return HomePageViewModel(repository: repo);
});
