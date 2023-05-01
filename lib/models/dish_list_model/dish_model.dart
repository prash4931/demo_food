
import 'package:json_annotation/json_annotation.dart';

part 'dish_model.g.dart';

@JsonSerializable()
class DishModel {
  final String? name;
  final double? rating;
  final String? description;
  final List<String>? equipments;
  final String? image;
  final int? id;

  DishModel(
      {this.name,
      this.rating,
      this.description,
      this.equipments,
      this.image,
      this.id});

  factory DishModel.fromJson(Map<String, dynamic> json) =>
      _$DishModelFromJson(json);

  Map<String, dynamic> toJson() => _$DishModelToJson(this);
}
