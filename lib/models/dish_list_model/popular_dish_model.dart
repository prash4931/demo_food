import 'package:json_annotation/json_annotation.dart';

part 'popular_dish_model.g.dart';

@JsonSerializable()
class PopularDishModel {
  final String? name;
  final String? image;
  final int? id;

  PopularDishModel({this.name, this.image, this.id});

  factory PopularDishModel.fromJson(Map<String, dynamic> json) =>
      _$PopularDishModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularDishModelToJson(this);
}
