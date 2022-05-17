import '../../core/either.dart';
import '../../core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> login(
    String email,
    String password,
  );

  Future<Either<Failure, bool>> isAuthenticated();
}
