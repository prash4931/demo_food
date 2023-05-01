import 'package:demo_food/repository/dishes_repository.dart';
import 'package:demo_food/repository/i_dishes_repository.dart';
import 'package:flutter/material.dart';

import '../models/dish_list_model/dish_model.dart';
import '../models/dish_list_model/popular_dish_model.dart';

class DishListProvider extends ChangeNotifier {
  IDishesRepository repository = DishesRepository();

  List<DishModel?> dishesList = [];

  List<PopularDishModel?> popularDishList = [];

  bool isLoading = false;

  init() {
    clearData();
    getDishesList();
  }

  clearData() {
    dishesList.clear();
    isLoading = true;
    notifyListeners();
  }

  Future<void> getDishesList() async {
    final response = await repository.getAllDishes();

    if (response != null) {
      if (response.dishes != null && response.dishes!.isNotEmpty) {
        dishesList.addAll(response.dishes!);
      }
      if (response.popularDishes != null &&
          response.popularDishes!.isNotEmpty) {
        popularDishList.addAll(response.popularDishes!);
        notifyListeners();
      } else {
        notifyListeners();
      }
    }
    isLoading = false;
    notifyListeners();
  }
}
