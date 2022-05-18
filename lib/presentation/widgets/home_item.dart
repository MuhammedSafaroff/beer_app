import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    Key? key,
    required this.image,
    required this.name,
    required this.abv,
    this.onTap,
  }) : super(key: key);
  final String image;
  final String name;
  final String abv;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
        shadowColor: Colors.black.withOpacity(0.15),
        child: InkWell(
          borderRadius: BorderRadius.circular(15.0),
          onTap: onTap,
          child: Container(
            height: 300,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Image.network(
                        image,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      flex: 1,
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      abv,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
