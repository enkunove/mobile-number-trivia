import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/errors/failures.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

import '../repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, void>{

  final NumberTriviaRepository repository;

  const GetRandomNumberTrivia({required this.repository});

  @override
  Future<Either<Failure, NumberTrivia>> call(void params) async {
    return await repository.getRandomNumberTrivia();
  }

}