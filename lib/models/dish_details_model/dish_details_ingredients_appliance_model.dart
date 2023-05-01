
import 'package:json_annotation/json_annotation.dart';

part 'dish_details_ingredients_appliance_model.g.dart';

@JsonSerializable()
class DishDetailsIngredientsAppliancesModel {
  final String? name;
  final String? image;

  DishDetailsIngredientsAppliancesModel({this.name, this.image});

  factory DishDetailsIngredientsAppliancesModel.fromJson(
          Map<String, dynamic> json) =>
      _$DishDetailsIngredientsAppliancesModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DishDetailsIngredientsAppliancesModelToJson(this);
}
