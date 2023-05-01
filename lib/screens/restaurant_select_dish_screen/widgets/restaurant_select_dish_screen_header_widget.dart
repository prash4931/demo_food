import 'package:flutter/material.dart';

import '../../../provider/dish_list_provider.dart';

class RestaurantSelectDishScreenHeaderWidget extends StatelessWidget {
  final DishListProvider state;
  const RestaurantSelectDishScreenHeaderWidget(
      {super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                color: Colors.black,
                height: 50,
              ),
              Positioned(
                left: 20,
                right: 20,
                top: 20,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.date_range),
                              SizedBox(
                                width: 5,
                              ),
                              Text('21 May 2021')
                            ],
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(Icons.watch_later_outlined),
                              SizedBox(
                                width: 5,
                              ),
                              Text('10:30 Pm-12:30 Pm')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 40,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ChoiceChip(
                        label: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            'Italian',
                          ),
                        ),
                        labelStyle: TextStyle(
                            color: index == 0 ? Colors.orange : Colors.grey),
                        backgroundColor: Colors.white,
                        disabledColor: Colors.white,
                        selectedColor: Colors.white,
                        shape: StadiumBorder(
                            side: BorderSide(
                                color:
                                    index == 0 ? Colors.orange : Colors.grey)),
                        selected: index == 0 ? true : false),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          if (state.popularDishList.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Popular Dishes',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 90,
                  child: ListView.builder(
                    itemCount: state.popularDishList.length,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = state.popularDishList[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Stack(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: index != 0
                                          ? Colors.orange
                                          : Colors.transparent)),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipOval(
                                  child: Image.network(
                                    item?.image ?? '',
                                    height: 90,
                                    width: 90,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    },
                                    fit: BoxFit.cover,
                                    color: Colors.black.withOpacity(0.3),
                                    colorBlendMode: BlendMode.darken,
                                  ),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              left: 20,
                              right: 20,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  item?.name ?? 'NA',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            )
        ],
      ),
    );
  }
}
