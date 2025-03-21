import 'dart:convert';

import 'package:number_trivia/core/errors/exceptions.dart';
import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDatasource {
  Future<NumberTriviaModel> getLastNumberTrivia();
  Future<void> cacheNumberTrivia(NumberTriviaModel instance);
}
const String CACHED_NUMBER_TRIVIA = 'CACHED_NUMBER_TRIVIA';

class LocalDatasourceImpl implements LocalDatasource {
  final SharedPreferences sharedPreferences;

  LocalDatasourceImpl(this.sharedPreferences);

  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel instance) {
    return sharedPreferences.setString(CACHED_NUMBER_TRIVIA, json.encode(instance.toJson()));
  }

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final jsonString = sharedPreferences.getString(CACHED_NUMBER_TRIVIA);
    if (jsonString != null) {
      return Future.value(NumberTriviaModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
