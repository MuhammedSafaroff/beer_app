import 'package:beer_app/domain/entities/beers.dart';
import 'package:flutter/material.dart';

class HomeDetails extends StatelessWidget {
  const HomeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beers = ModalRoute.of(context)?.settings.arguments as Beers;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  Image.network(
                    beers.imageUrl!,
                    width: width / 2,
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          beers.name!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          beers.abv.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.indigo,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          beers.tagline!,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Text(
                "Description",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                beers.description!,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
