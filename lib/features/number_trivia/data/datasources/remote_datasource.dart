import '../models/number_trivia_model.dart';

abstract class RemoteDatasource{
  Future<NumberTriviaModel>getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel>getRandomNumberTrivia();
}