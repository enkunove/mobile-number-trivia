import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/local_datasource.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/remote_datasource.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockDioClient extends Mock implements Dio {}

void main() {
  late RemoteDatasourceImpl remoteDatasourceImpl;
  late MockDioClient mockDioClient;

  setUp(() {
    mockDioClient = MockDioClient();
    remoteDatasourceImpl = RemoteDatasourceImpl(mockDioClient);
  });
  group("getConcreteNumberTrivia", () {
    final tNumber = 1;
    test("should perform GET request", () async {
      when(() => mockDioClient.get(any(), options: any(named: 'options')))
          .thenAnswer((_) async => Response(
        requestOptions: RequestOptions(path: ''),
        statusCode: 200,
        data: jsonDecode(fixture('trivia_cached.json')),
      ));

      await remoteDatasourceImpl.getConcreteNumberTrivia(tNumber);

      verify(() => mockDioClient.get(
        'http://numbersapi.com/$tNumber',
        options: any(named: 'options'),
      ));

    });
  });
}
