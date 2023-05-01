import 'package:json_annotation/json_annotation.dart';

import 'dish_model.dart';
import 'popular_dish_model.dart';

part 'dishes_response_model.g.dart';

@JsonSerializable()
class DishesResponseModel {
  final List<DishModel>? dishes;
  final List<PopularDishModel>? popularDishes;

  DishesResponseModel({this.dishes, this.popularDishes});

  factory DishesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DishesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DishesResponseModelToJson(this);
}
