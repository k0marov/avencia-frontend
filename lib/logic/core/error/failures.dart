import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
  const Failure();
}

class UnknownFailure extends Failure {
  final dynamic exception;
  @override
  List get props => [exception];
  const UnknownFailure(this.exception);
}

class MappingFailure extends Failure {}

class NoTokenFailure extends Failure {}

class NetworkFailure extends Failure {
  final int statusCode;
  final String body;
  @override
  List get props => [statusCode, body];

  const NetworkFailure(this.statusCode, this.body);
}
