import 'package:number_trivia/features/number_trivia/data/models/number_trivia_model.dart';

abstract class LocalDatasource{
  Future<NumberTriviaModel> getLastNumberTrivia();
  Future<void> cacheNumberTrivia(NumberTriviaModel instance);
}

