import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  // getIt.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(
  //     authRemoteDataSource: getIt(),
  //     preferencesLocalDataSource: getIt(),
  //   ),
  // );
}
