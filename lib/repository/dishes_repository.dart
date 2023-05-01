import 'dart:convert';

import 'package:demo_food/core/core_http.dart';
import 'package:demo_food/core/end_points.dart';
import 'package:demo_food/models/dish_details_model/dish_details_response_model.dart';
import 'package:demo_food/models/dish_list_model/dishes_response_model.dart';
import 'package:demo_food/repository/i_dishes_repository.dart';

import '../utils/custom_logger.dart';

class DishesRepository extends IDishesRepository {
  @override
  Future<DishesResponseModel?> getAllDishes() async {
    try {
      const url = EndPoints.getAllDishesURL;

      final response = await getHttp(url: url);
      logInfo(msg: '✔️ getAllDishes\n url: $url \n response: ${response.body}');
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        final res =
            DishesResponseModel.fromJson(result as Map<String, dynamic>);
        return res;
      } else {
        return null;
      }
    } catch (e) {
      logError(msg: '❌ API getAllDishes Error: $e');
      return null;
    }
  }

  @override
  Future<DishDetailsResponseModel?> getDisheDetails({required String dishId}) async {
    try {
      final url = '${EndPoints.getAllDishesURL}/$dishId';

      final response = await getHttp(url: url);
      logInfo(msg: '✔️ getDisheDetails\n url: $url \n response: ${response.body}');
      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);

        final res =
            DishDetailsResponseModel.fromJson(result as Map<String, dynamic>);
        return res;
      } else {
        return null;
      }
    } catch (e) {
      logError(msg: '❌ API getDisheDetails Error: $e');
      return null;
    }
  }
}
