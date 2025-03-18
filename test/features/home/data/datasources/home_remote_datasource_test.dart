import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_dropdown_cleanblc/core/network/endpoints.dart';
import 'package:flutter_dropdown_cleanblc/core/network/network_client.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/datasources/home_remote_datasource.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/models/place.dart';
import 'package:dio/dio.dart';

// Mock NetworkClient
class MockNetworkClient extends Mock implements NetworkClient {}

void main() {
  late HomeRemoteDatasourceImpl datasource;
  late MockNetworkClient mockNetworkClient;

  setUp(() {
    mockNetworkClient = MockNetworkClient();
    datasource = HomeRemoteDatasourceImpl(networkClient: mockNetworkClient);
  });

  group('HomeRemoteDatasourceImpl', () {
    final mockCountriesResponse = [
      {"id": 1, "value": "USA"},
      {"id": 2, "value": "India"}
    ];

    final mockStatesResponse = [
      {"id": 101, "value": "California"},
      {"id": 102, "value": "Texas"}
    ];

    test('getCountries() should return a list of countries on success',
        () async {
      when(() => mockNetworkClient.get(Endpoints.countries)).thenAnswer(
        (_) async => Response(
          data: mockCountriesResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: Endpoints.countries),
        ),
      );

      final result = await datasource.getCountries();

      expect(result, isA<List<Place>>());
      expect(result.length, 2);
      expect(result.first.id, 1);
      expect(result.first.value, "USA");
      verify(() => mockNetworkClient.get(Endpoints.countries)).called(1);
    });

    test('getStatesForCountry() should return a list of states on success',
        () async {
      const countryId = 1;
      final endpoint = '${Endpoints.countries}/$countryId${Endpoints.states}';

      when(() => mockNetworkClient.get(endpoint)).thenAnswer(
        (_) async => Response(
          data: mockStatesResponse,
          statusCode: 200,
          requestOptions: RequestOptions(path: endpoint),
        ),
      );

      final result = await datasource.getStatesForCountry(countryId);

      expect(result, isA<List<Place>>());
      expect(result.length, 2);
      expect(result.first.id, 101);
      expect(result.first.value, "California");
      verify(() => mockNetworkClient.get(endpoint)).called(1);
    });
  });
}
