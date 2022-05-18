import 'package:beer_app/injection/src/externals.dart';
import 'package:beer_app/presentation/pages/favorite/favorite_page.dart';
import 'package:beer_app/presentation/pages/home/home_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/beers/beers_cubit.dart';

class AppPages {
  static List<Widget> pages = [
    BlocProvider(
      create: (context) => getIt<BeersCubit>()..fetchBeers(),
      child: const HomePage(),
    ),
    const FavoritePage(),
  ];
  static List<String> titles = [
    "Home",
    "Favorite",
  ];
}
