import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:geopilot_practice/core/failures_successes.dart';

abstract class UseCase<Type, Equatable> {
  Future<Either<Failure, Type>> call(Equatable params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}