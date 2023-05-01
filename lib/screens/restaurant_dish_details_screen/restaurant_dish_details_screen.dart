import 'package:demo_food/screens/restaurant_dish_details_screen/widgets/restaurant_dish_details_head_widget.dart';
import 'package:demo_food/screens/restaurant_dish_details_screen/widgets/restuarant_dish_details_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../provider/dish_details_provider.dart';

class RestaurantDishDetailsScreen extends StatefulWidget {
  final String dishID;
  final String
      rating; //Rating taken from previous screen because not available in details api
  final String
      description; //Description taken from previous screen because not available in details api
  const RestaurantDishDetailsScreen(
      {super.key,
      required this.dishID,
      required this.rating,
      required this.description});

  @override
  State<RestaurantDishDetailsScreen> createState() =>
      _RestaurantDishDetailsScreenState();
}

class _RestaurantDishDetailsScreenState
    extends State<RestaurantDishDetailsScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<DishDetailsProvider>(context, listen: false)
          .init(dishID: widget.dishID);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DishDetailsProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (value.dishDetails != null) {
            return NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                  ),
                ];
              },
              body: Stack(
                
                children: [
                  Column(
                    children: [
                      RestaurantDishDetailsHeadWidget(
                        name: value.dishDetails?.name ?? 'NA',
                        rating: widget.rating,
                        description: widget.description,
                        timeToPrepare: value.dishDetails?.timeToPrepare ?? 'NA',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RestaurantDishDetailsBodyWidget(value: value)
                    ],
                  ),
                  
                  Positioned(
                      top: -20,
                      right: -80,
                      child: Image.network(
                        'https://i.imgur.com/tnRleRk.png',
                        height: 300,
                        width: 300,
                      )),
                ],
              ),
              // body: ,
            );
          }
          return const Text('Something Went Wrong');
        },
      ),
    );
  }
}
