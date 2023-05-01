import 'package:demo_food/screens/restaurant_select_dish_screen/restaurant_select_dish_screen.dart';
import 'package:demo_food/services/all_provider_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: allproviderList(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Demo Food',
      home: RestaurantSelectDishScreen(),
    );
  }
}
