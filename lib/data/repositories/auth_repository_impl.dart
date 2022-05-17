// import 'package:dio/dio.dart';

// import '../../core/either.dart';
// import '../../core/error/exceptions.dart';
// import '../../core/error/failure.dart';
// import '../../domain/repositories/auth_repository.dart';
// import '../data_sources/local/preferences_local_data_source.dart';
// import '../data_sources/remote/auth_remote_data_source.dart';
// import '../models/request/login_request_model.dart';
// import '../models/response/generic_response_model.dart';

// class AuthRepositoryImpl implements AuthRepository {
//   const AuthRepositoryImpl({
//     required this.authRemoteDataSource,
//     required this.preferencesLocalDataSource,
//   });

//   final AuthRemoteDataSource authRemoteDataSource;
//   final PreferencesLocalDataSource preferencesLocalDataSource;

//   @override
//   Future<Either<Failure<String>, Unit>> login(
//     String email,
//     String password,
//   ) async {
//     try {
//       final result = await authRemoteDataSource.login(
//         LoginRequestModel(
//           email: email,
//           password: password,
//         ),
//       );

//       final data = result.data!;

//       await preferencesLocalDataSource.persistToken(data.token);
//       await preferencesLocalDataSource.persistName(data.name);

//       return const Success(unit);
//     } on DioError catch (e) {
//       if (e.response?.data != null) {
//         final response = GenericResponseModel.fromJson(e.response!.data);
//         return Error(Failure.network(response.message));
//       } else {
//         return const Error(Failure.network());
//       }
//     } on SecureStorageException {
//       return const Error(Failure.cache());
//     } catch (_) {
//       return const Error(Failure.other());
//     }
//   }

//   @override
//   Future<Either<Failure, bool>> isAuthenticated() async {
//     try {
//       final result = await preferencesLocalDataSource.token;
//       return Success(result != null);
//     } on SecureStorageException {
//       return const Error(Failure.cache());
//     }
//   }
// }