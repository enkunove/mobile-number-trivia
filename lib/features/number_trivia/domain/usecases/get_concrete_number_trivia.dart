import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/errors/failures.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia{
  final NumberTriviaRepository repository;

  const GetConcreteNumberTrivia({required this.repository});

  Future<Either<Failure, NumberTrivia>>execute({required int number}) async{
    return await repository.getConcreteNumberTrivia(number);
  }
}