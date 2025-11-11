import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

class ApiFailure extends Failure {
  final int? code;
  const ApiFailure(super.message, {required this.code});

  @override
  List<Object?> get props => [message, code];
}

class UnExpectedFailure extends Failure {
  const UnExpectedFailure(super.message);

  @override
  List<Object?> get props => [message];
}

class NoInternetFailure extends Failure {
  const NoInternetFailure() : super('No Internet');

  @override
  List<Object?> get props => [message];
}
