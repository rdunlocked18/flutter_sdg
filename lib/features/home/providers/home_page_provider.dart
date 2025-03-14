import 'package:dio/dio.dart';
import 'package:flutter_dropdown_cleanblc/core/network/network_client.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/datasources/home_remote_datasource.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/respository/home_repository.dart';
import 'package:flutter_dropdown_cleanblc/features/home/presentation/state/home_state.dart';
import 'package:flutter_dropdown_cleanblc/features/home/presentation/viewmodel/home_page_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final networkClientProvider = Provider(
  (ref) => NetworkClient(
    Dio(),
  ),
);

final homeRemoteDatasourceProvider = Provider<HomeRemoteDatasource>((ref) {
  var client = ref.read(networkClientProvider);
  return HomeRemoteDatasourceImpl(networkClient: client);
});

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  final remoteDatasource = ref.read(homeRemoteDatasourceProvider);
  return HomeRepository(remoteDatasource: remoteDatasource);
});

final homePageProvider =
    StateNotifierProvider<HomePageViewModel, HomeState>((ref) {
  final repo = ref.read(homeRepositoryProvider);
  return HomePageViewModel(repository: repo);
});
