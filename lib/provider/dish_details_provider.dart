import 'package:demo_food/repository/dishes_repository.dart';
import 'package:demo_food/repository/i_dishes_repository.dart';
import 'package:flutter/cupertino.dart';

import '../models/dish_details_model/dish_details_response_model.dart';

class DishDetailsProvider extends ChangeNotifier {
  IDishesRepository repository = DishesRepository();

  DishDetailsResponseModel? dishDetails;

  bool isLoading = false;

  init({required String dishID}) {
    clearData();
    getDishesDetails(dishID: dishID);
  }

  clearData() {
    isLoading = true;
  }

  Future<void> getDishesDetails({
    required String dishID,
  }) async {
    final response = await repository.getDisheDetails(dishId: dishID);

    if (response != null) {
      dishDetails = response;
      notifyListeners();
    } else {
      notifyListeners();
    }
    isLoading = false;
    notifyListeners();
  }
}
