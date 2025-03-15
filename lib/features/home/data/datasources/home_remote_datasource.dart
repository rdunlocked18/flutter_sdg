import 'package:flutter_dropdown_cleanblc/core/network/endpoints.dart';
import 'package:flutter_dropdown_cleanblc/core/network/network_client.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/models/place.dart';

abstract class HomeRemoteDatasource {
  Future<List<Place>> getCountries();
  Future<List<Place>> getStatesForCountry(int id);
}

class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final NetworkClient networkClient;

  HomeRemoteDatasourceImpl({required this.networkClient});

  @override
  Future<List<Place>> getCountries() async {
    var response = await networkClient.get(Endpoints.countries);
    if (response.statusCode == 200) {
      var countries = (response.data as List)
          .map((country) => Place.fromJson(country))
          .toList();
      return countries;
    } else {
      return [];
    }
  }

  @override
  Future<List<Place>> getStatesForCountry(int id) async {
    var response = await networkClient
        .get('${Endpoints.countries}/$id${Endpoints.states}');

    if (response.statusCode == 200) {
      var states = (response.data as List)
          .map((state) => Place.fromJson(state))
          .toList();
      return states;
    } else {
      return [];
    }
  }
}
