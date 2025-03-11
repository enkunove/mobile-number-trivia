import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/core/errors/exceptions.dart';
import 'package:number_trivia/features/number_trivia/data/datasources/local_datasource.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences{}

void main(){
  late LocalDatasourceImpl localDatasourceImpl;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    localDatasourceImpl = LocalDatasourceImpl(MockSharedPreferences());
  });

  group("get last number trivia", () {
    final tNumberTriviaModel = NumberTriviaModel.fromJson(json.decode(fixture('trivia_cached.json')));
    test("should return cached NumberTriviaModel", () async{
      when(() => mockSharedPreferences.getString(any())).thenReturn(fixture('trivia_cached.json'));
      final result = await localDatasourceImpl.getLastNumberTrivia();

      verify(() => mockSharedPreferences.getString(CACHED_NUMBER_TRIVIA));
      expect(result, tNumberTriviaModel);
    });
    test("should throw cacheException", () async{
      when(() => mockSharedPreferences.getString(any())).thenReturn(null);
      final call = localDatasourceImpl.getLastNumberTrivia;

      expect(() => call(), throwsA(TypeMatcher<CacheException>()));
    });
  });
  group("set last number trivia", () {
    final tNumberTriviaModel = NumberTriviaModel.fromJson(json.decode(fixture('trivia_cached.json')));
    test("should call SharedPreferences to cache data", () async{
      localDatasourceImpl.cacheNumberTrivia(tNumberTriviaModel);

      verify(() => mockSharedPreferences.setString(CACHED_NUMBER_TRIVIA, json.encode(tNumberTriviaModel.toJson())));
    });
  });
}