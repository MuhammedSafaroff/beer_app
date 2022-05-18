import 'package:flutter/material.dart';

class HomeItem extends StatefulWidget {
  HomeItem({
    Key? key,
    required this.image,
    required this.name,
    required this.abv,
    required this.id,
    required this.isFavorite,
    this.onTap,
  }) : super(key: key);
  final int id;
  final String image;
  final String name;
  final String abv;
  bool isFavorite;
  final void Function()? onTap;

  @override
  State<HomeItem> createState() => _HomeItemState();
}

class _HomeItemState extends State<HomeItem> {
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
          onTap: widget.onTap,
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
                        widget.image,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      flex: 1,
                      child: Text(
                        widget.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.abv,
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
                    child: StatefulBuilder(
                      builder: (context, setState) => IconButton(
                        onPressed: () {
                          setState(
                            () => widget.isFavorite = !widget.isFavorite,
                          );
                        },
                        icon: Icon(
                          widget.isFavorite ? Icons.favorite_sharp : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
