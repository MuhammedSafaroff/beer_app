import 'package:meta/meta.dart';

typedef OnError<E> = void Function(E error);
typedef OnSuccess<S> = void Function(S success);

@sealed
abstract class Either<E, S> {
  const Either();

  E? getError();

  S? getSuccess();

  bool isError();

  bool isSuccess();

  Future<void> when({
    required OnError<E> error,
    required OnSuccess<S> success,
  });
}

@immutable
class Success<E, S> implements Either<E, S> {
  const Success(this._success);

  final S _success;

  @override
  bool isError() => false;

  @override
  bool isSuccess() => true;

  @override
  E? getError() => null;

  @override
  S? getSuccess() => _success;

  @override
  Future<void> when({
    required OnError<E> error,
    required OnSuccess<S> success,
  }) async {
    success(_success);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Success && other._success == _success;

  @override
  int get hashCode => _success.hashCode;
}

@immutable
class Error<E, S> implements Either<E, S> {
  const Error(this._error);

  final E _error;

  @override
  bool isError() => true;

  @override
  bool isSuccess() => false;

  @override
  E? getError() => _error;

  @override
  S? getSuccess() => null;

  @override
  Future<void> when({
    required OnError<E> error,
    required OnSuccess<S> success,
  }) async {
    error(_error);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Error && other._error == _error;

  @override
  int get hashCode => _error.hashCode;
}

@immutable
class Unit {
  const Unit._internal();

  @override
  String toString() => '()';
}

const unit = Unit._internal();
