import 'package:beer_app/presentation/widgets/home_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: width / 2 - 15,
          mainAxisExtent: 300,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return const HomeItem(
            image: "https://images.punkapi.com/v2/keg.png",
            name: "Buzz",
            abv: "4,5",
          );
        },
      ),
    );
  }
}
