import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/datasources/home_remote_datasource.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/models/place.dart';
import 'package:flutter_dropdown_cleanblc/features/home/data/respository/home_repository.dart';

// Mock Data Source
class MockHomeRemoteDatasource extends Mock implements HomeRemoteDatasource {}

void main() {
  late HomeRepository repository;
  late MockHomeRemoteDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockHomeRemoteDatasource();
    repository = HomeRepository(remoteDatasource: mockDatasource);
  });

  group('HomeRepository', () {
    final mockCountries = [
      Place(id: 1, value: 'USA'),
      Place(id: 2, value: 'India')
    ];
    final mockStates = [
      Place(id: 101, value: 'California'),
      Place(id: 102, value: 'Texas')
    ];

    test('getCountries() should return list of countries', () async {
      when(() => mockDatasource.getCountries())
          .thenAnswer((_) async => mockCountries);

      final result = await repository.getCountries();

      expect(result, mockCountries);
      verify(() => mockDatasource.getCountries()).called(1);
    });

    test('getStatesForCountry() should return list of states', () async {
      when(() => mockDatasource.getStatesForCountry(1))
          .thenAnswer((_) async => mockStates);

      final result = await repository.getStatesForCountry(1);

      expect(result, mockStates);
      verify(() => mockDatasource.getStatesForCountry(1)).called(1);
    });

    test('getCountries() should throw an exception on failure', () async {
      when(() => mockDatasource.getCountries()).thenThrow(Exception('Error'));

      expect(() => repository.getCountries(), throwsException);
    });

    test('getStatesForCountry() should throw an exception on failure',
        () async {
      when(() => mockDatasource.getStatesForCountry(1))
          .thenThrow(Exception('Error'));

      expect(() => repository.getStatesForCountry(1), throwsException);
    });
  });
}
