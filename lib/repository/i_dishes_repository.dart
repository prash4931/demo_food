import 'package:demo_food/models/dish_list_model/dishes_response_model.dart';

import '../models/dish_details_model/dish_details_response_model.dart';

abstract class IDishesRepository {
  Future<DishesResponseModel?> getAllDishes();
  Future<DishDetailsResponseModel?> getDisheDetails({required String dishId});
}
