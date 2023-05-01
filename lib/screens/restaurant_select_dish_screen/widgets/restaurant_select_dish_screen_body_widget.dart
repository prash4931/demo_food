import 'package:flutter/material.dart';

import '../../../provider/dish_list_provider.dart';
import '../../../utils/custom_logger.dart';
import '../../restaurant_dish_details_screen/restaurant_dish_details_screen.dart';

class RestaurantSelectDishScreenBodyWidget extends StatelessWidget {
  final DishListProvider state;
  const RestaurantSelectDishScreenBodyWidget({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: const [
                      Text(
                        'Recommended',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.arrow_drop_down)
                    ],
                  ),
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        visualDensity: VisualDensity.compact,
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black),
                        // fixedSize: MaterialStateProperty.all(
                        //     Size.fromWidth(100)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: () {},
                    child: const Text(
                      'Menu',
                      style: TextStyle(fontSize: 10),
                    )),
              ],
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = state.dishesList[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item?.name ?? 'NA',
                                  maxLines: 1,
                                  style: const TextStyle(fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          border: Border.all(
                                              color: Colors.green, width: 1)),
                                    ),
                                    Positioned.fill(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.green),
                                          height: 5,
                                          width: 5,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Stack(
                                  children: [
                                    Container(
                                      height: 15,
                                      // width: 10,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Colors.green),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${item?.rating ?? ''}',
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 8),
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
                                )
                              ],
                            ),
                            if (item?.equipments != null &&
                                item!.equipments!.isNotEmpty)
                              SizedBox(
                                height: 30,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: item.equipments!.length,
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          final equipmentItem =
                                              item.equipments![index];
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  equipmentItem.toLowerCase() ==
                                                          'refrigerator'
                                                      ? Icons.kitchen
                                                      : Icons.microwave,
                                                  size: 15,
                                                ),
                                                if (equipmentItem
                                                        .toLowerCase() ==
                                                    'refrigerator')
                                                  const Text(
                                                    'Refrigerator',
                                                    style:
                                                        TextStyle(fontSize: 6),
                                                  ),
                                                if (equipmentItem
                                                        .toLowerCase() ==
                                                    'microwave')
                                                  const Text(
                                                    'Microwave',
                                                    style:
                                                        TextStyle(fontSize: 6),
                                                  )
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      color: Colors.grey,
                                      height: 15,
                                      width: 1,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: TextButton(
                                          style: const ButtonStyle(
                                              visualDensity:
                                                  VisualDensity.compact),
                                          onPressed: () {
                                            if (item.id != null) {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                builder: (context) {
                                                  return RestaurantDishDetailsScreen(
                                                    dishID: '${item.id}',
                                                    rating: '${item.rating}',
                                                    description:
                                                        item.description ?? '',
                                                  );
                                                },
                                              ));
                                            } else {
                                              logError(
                                                  msg: 'Something went wrong!');
                                            }
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'Ingredients',
                                                style: TextStyle(
                                                    fontSize: 8,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                children: const [
                                                  Text(
                                                    'View List',
                                                    style: TextStyle(
                                                        color: Colors.orange,
                                                        fontSize: 8),
                                                  ),
                                                  Icon(
                                                    Icons.arrow_forward_ios,
                                                    size: 10,
                                                    color: Colors.orange,
                                                  )
                                                ],
                                              )
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            Text(
                              item?.description ?? 'NA',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 115,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                item?.image ?? '',
                                height: 100,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              left: 30,
                              right: 30,
                              bottom: 0,
                              child: InkWell(
                                onTap: () {
                                  debugPrint('Pressed');
                                },
                                child: SizedBox(
                                  height: 35,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: const BorderSide(
                                            color: Colors.orange)),
                                    child: const Center(
                                      child: Text(
                                        'Add',
                                        style: TextStyle(
                                            color: Colors.orange, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                                bottom: 15,
                                right: 40,
                                child: Icon(
                                  Icons.add,
                                  color: Colors.orange,
                                  size: 10,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemCount: state.dishesList.length)
        ],
      ),
    );
  }
}
