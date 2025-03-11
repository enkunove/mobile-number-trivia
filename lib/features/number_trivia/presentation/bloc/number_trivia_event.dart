part of 'number_trivia_bloc.dart';

sealed class NumberTriviaEvent extends Equatable {
  const NumberTriviaEvent();

}

class GetTriviaForConcreteNumber extends NumberTriviaEvent{

  final String numberString;

  const GetTriviaForConcreteNumber(this.numberString);

  @override
  List<Object?> get props => [this.numberString];
}

class GetTriviaForRandomNumber extends NumberTriviaEvent{

  const GetTriviaForRandomNumber();

  @override
  List<Object?> get props => [];
}