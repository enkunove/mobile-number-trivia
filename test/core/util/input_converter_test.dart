import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:number_trivia/core/util/input_converter.dart';

void main(){
  late InputConverter inputConverter;

  setUp(() => inputConverter = InputConverter());

  group("InputConverter", (){
    test("should return number from correct string", () async {
      final str = '123';

      final result = inputConverter.stringToUnsignedInt(str);

      expect(result, Right(123));
    });

    test("should return failure from incorrect string", () async {
      final str = 'aaa';

      final result = inputConverter.stringToUnsignedInt(str);

      expect(result, Left(InvalidInputFailure()));
    });
    test("should return failure from unsigned string", () async {
      final str = '-123';

      final result = inputConverter.stringToUnsignedInt(str);

      expect(result, Left(InvalidInputFailure()));
    });
  });
}