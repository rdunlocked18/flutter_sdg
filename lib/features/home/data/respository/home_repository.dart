import 'package:flutter_dropdown_cleanblc/features/home/data/datasources/home_remote_datasource.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/models/place.dart';

class HomeRepository {
  final HomeRemoteDatasource remoteDatasource;

  HomeRepository({required this.remoteDatasource});

  Future<List<Place>> getCountries() async {
    try {
      return await remoteDatasource.getCountries();
    } catch (e) {
      throw Exception('Cannot get Countries $e');
    }
  }

  Future<List<Place>> getStatesForCountry(int id) async {
    try {
      return await remoteDatasource.getStatesForCountry(id);
    } catch (e) {
      throw Exception('Cannot get States $e');
    }
  }
}
