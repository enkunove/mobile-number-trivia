import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/errors/failures.dart';

class InputConverter{
  Either<Failure, int> stringToUnsignedInt(String input){
    try {
      int parsed = int.parse(input);
      if (parsed<0) throw FormatException();
      else return Right(parsed);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure{}