import 'package:flutter/material.dart';

import '../../../provider/dish_details_provider.dart';

class RestaurantDishDetailsBodyWidget extends StatelessWidget {
  final DishDetailsProvider value;

  const RestaurantDishDetailsBodyWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ingredients',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'For 2 People',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  overflow: TextOverflow.ellipsis),
            ),
            const Divider(
              height: 30,
            ),
            if (value.dishDetails?.ingredients != null) ...[
              if (value.dishDetails?.ingredients!.vegetables != null &&
                  value.dishDetails!.ingredients!.vegetables!.isNotEmpty)
                Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Vegatables',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' (${value.dishDetails!.ingredients!.vegetables!.length})',
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      itemCount:
                          value.dishDetails!.ingredients!.vegetables!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final vegatableItem =
                            value.dishDetails!.ingredients!.vegetables![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                vegatableItem.name ?? 'NA',
                                style: const TextStyle(fontSize: 12),
                              )),
                              Text(
                                vegatableItem.quantity ?? 'NA',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              if (value.dishDetails!.ingredients!.spices != null &&
                  value.dishDetails!.ingredients!.spices!.isNotEmpty)
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Text(
                          'Spices',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' (${value.dishDetails!.ingredients!.spices!.length})',
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                    ListView.builder(
                      itemCount: value.dishDetails!.ingredients!.spices!.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final vegatableItem =
                            value.dishDetails!.ingredients!.spices![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                vegatableItem.name ?? 'NA',
                                style: const TextStyle(fontSize: 12),
                              )),
                              Text(
                                vegatableItem.quantity ?? 'NA',
                                style: const TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              if (value.dishDetails!.ingredients!.appliances != null &&
                  value.dishDetails!.ingredients!.appliances!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Appliances',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemCount:
                            value.dishDetails!.ingredients!.appliances!.length,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final appliancesItem = value
                              .dishDetails!.ingredients!.appliances![index];
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Container(
                              width: 80,
                              decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    (appliancesItem.image != null &&
                                            appliancesItem.image!.isNotEmpty)
                                        ? appliancesItem.image!
                                        : 'https://pngimg.com/uploads/refrigerator/refrigerator_PNG101546.png',
                                    height: 30,
                                    width: 30,
                                  ),
                                  Text(
                                    appliancesItem.name ?? 'NA',
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
            ]
          ],
        ),
      ),
    );
  }
}
