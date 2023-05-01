import 'package:json_annotation/json_annotation.dart';

import 'dish_details_ingredients_model.dart';

part 'dish_details_response_model.g.dart';

@JsonSerializable()
class DishDetailsResponseModel {
  final String? name;
  final int? id;
  final String? timeToPrepare;
  final DishDetailsIngredientsModel? ingredients;

  DishDetailsResponseModel(
      {this.name, this.id, this.timeToPrepare, this.ingredients});

  factory DishDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DishDetailsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$DishDetailsResponseModelToJson(this);
}
