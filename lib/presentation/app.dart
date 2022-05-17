import 'package:beer_app/injection/src/externals.dart';
import 'package:beer_app/presentation/pages/main/main_page.dart';
import 'package:beer_app/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/bottom_nav/bottom_nav_cubit.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Garanti',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      theme: ThemeData(
        primaryColor: const Color(0xFF4D148C),
      ),
      home: BlocProvider(
        create: (context) => getIt<BottomNavCubit>(),
        child: const MainPage(),
      ),
    );
  }
}
