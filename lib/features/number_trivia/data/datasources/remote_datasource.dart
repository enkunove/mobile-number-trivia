import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:number_trivia/core/errors/exceptions.dart';

import '../models/number_trivia_model.dart';

abstract class RemoteDatasource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class RemoteDatasourceImpl implements RemoteDatasource {
  final Dio dio;

  RemoteDatasourceImpl(this.dio);

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    try {
      final response = await dio.get(
        'http://numbersapi.com/$number',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        return NumberTriviaModel.fromJson(response.data is String
            ? jsonDecode(response.data)
            : response.data);
      }
      else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    try {
      final response = await dio.get(
        'http://numbersapi.com/random',
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );
      if (response.statusCode == 200) {
        return NumberTriviaModel.fromJson(response.data is String
            ? jsonDecode(response.data)
            : response.data);
      }
      else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
