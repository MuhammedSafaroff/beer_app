import 'package:get_it/get_it.dart';

import '../../presentation/blocs/bottom_nav/bottom_nav_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerFactory(() => BottomNavCubit());
}
