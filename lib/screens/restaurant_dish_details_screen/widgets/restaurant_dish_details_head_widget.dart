import 'package:flutter/material.dart';

class RestaurantDishDetailsHeadWidget extends StatelessWidget {
  final String name, rating, description, timeToPrepare;
  const RestaurantDishDetailsHeadWidget(
      {super.key,
      required this.name,
      required this.rating,
      required this.description,
      required this.timeToPrepare});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: -10,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.red[50]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 15,
                          // width: 10,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.green),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                              children: [
                                Text(
                                  rating,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 8),
                                ),
                                const Icon(
                                  Icons.star_rounded,
                                  color: Colors.white,
                                  size: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: Text(
                        description,
                        maxLines: 3,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.watch_later_outlined),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          timeToPrepare,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
