import 'package:beer_app/presentation/pages/favorite/favorite_page.dart';
import 'package:beer_app/presentation/pages/home/home_page.dart';
import 'package:flutter/widgets.dart';

class AppPages {
  static List<Widget> pages = [
    const HomePage(),
    const FavoritePage(),
  ];
  static List<String> titles = [
    "Home",
    "Favorite",
  ];
}
