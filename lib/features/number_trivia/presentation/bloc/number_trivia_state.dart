part of 'number_trivia_bloc.dart';

sealed class NumberTriviaState extends Equatable {
  const NumberTriviaState();
}

final class NumberTriviaInitial extends NumberTriviaState {
  @override
  List<Object> get props => [];
}

final class NumberTriviaLoading extends NumberTriviaState {
  @override
  List<Object> get props => [];
}

final class NumberTriviaLoaded extends NumberTriviaState {
  final NumberTrivia numberTrivia;

  NumberTriviaLoaded(this.numberTrivia);
  @override
  List<Object> get props => [this.numberTrivia];
}

final class NumberTriviaError extends NumberTriviaState {
  final String message;

  NumberTriviaError(this.message);
  @override
  List<Object> get props => [message];
}