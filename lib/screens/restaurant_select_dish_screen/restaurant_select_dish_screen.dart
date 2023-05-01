import 'package:demo_food/screens/restaurant_select_dish_screen/widgets/restaurant_select_dish_screen_body_widget.dart';
import 'package:demo_food/screens/restaurant_select_dish_screen/widgets/restaurant_select_dish_screen_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import '../../provider/dish_list_provider.dart';

class RestaurantSelectDishScreen extends StatefulWidget {
  const RestaurantSelectDishScreen({super.key});

  @override
  State<RestaurantSelectDishScreen> createState() =>
      _RestaurantSelectDishScreenState();
}

class _RestaurantSelectDishScreenState
    extends State<RestaurantSelectDishScreen> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<DishListProvider>(context, listen: false).init();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_rounded)),
        title: const Text(
          'Select Dishes',
          style: TextStyle(),
        ),
      ),
      body: Consumer<DishListProvider>(
        builder: (context, state, child) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: Column(children: [
              RestaurantSelectDishScreenHeaderWidget(
                state: state,
              ),
              const SizedBox(
                height: 10,
              ),
              if (state.dishesList.isNotEmpty)
                RestaurantSelectDishScreenBodyWidget(state: state)
            ]),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: ElevatedButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.black),
                fixedSize: MaterialStateProperty.all(const Size.fromHeight(50)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
            onPressed: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.fastfood_outlined,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: Text('3 food items selected')),
                Icon(Icons.arrow_right_alt)
              ],
            )),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
