import 'package:equatable/equatable.dart';

class NumberTrivia extends Equatable{

  final String text;
  final int number;

  const NumberTrivia({required this.number, required this.text});

  @override
  List<Object?> get props => [text, number];
}