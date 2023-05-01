// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dishes_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishesResponseModel _$DishesResponseModelFromJson(Map<String, dynamic> json) =>
    DishesResponseModel(
      dishes: (json['dishes'] as List<dynamic>?)
          ?.map((e) => DishModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      popularDishes: (json['popularDishes'] as List<dynamic>?)
          ?.map((e) => PopularDishModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DishesResponseModelToJson(
        DishesResponseModel instance) =>
    <String, dynamic>{
      'dishes': instance.dishes,
      'popularDishes': instance.popularDishes,
    };
