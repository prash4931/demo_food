import 'package:json_annotation/json_annotation.dart';

part 'dish_details_ingredients_spice_model.g.dart';

@JsonSerializable()
class DishDetailsIngredientsSpiceModel {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'quantity')
  final String? quantity;

  DishDetailsIngredientsSpiceModel({this.name, this.quantity});

  factory DishDetailsIngredientsSpiceModel.fromJson(
          Map<String, dynamic> json) =>
      _$DishDetailsIngredientsSpiceModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DishDetailsIngredientsSpiceModelToJson(this);
}
