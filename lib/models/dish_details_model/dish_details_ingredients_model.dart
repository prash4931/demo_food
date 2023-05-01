import 'package:json_annotation/json_annotation.dart';

import 'dish_details_ingredients_appliance_model.dart';
import 'dish_details_ingredients_spice_model.dart';

part 'dish_details_ingredients_model.g.dart';

@JsonSerializable()
class DishDetailsIngredientsModel {
  final List<DishDetailsIngredientsSpiceModel>? vegetables;
  final List<DishDetailsIngredientsSpiceModel>? spices;
  final List<DishDetailsIngredientsAppliancesModel>? appliances;

  DishDetailsIngredientsModel({this.vegetables, this.spices, this.appliances});

  factory DishDetailsIngredientsModel.fromJson(
          Map<String, dynamic> json) =>
      _$DishDetailsIngredientsModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DishDetailsIngredientsModelToJson(this);
}
