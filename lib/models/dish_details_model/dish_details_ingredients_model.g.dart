// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_details_ingredients_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishDetailsIngredientsModel _$DishDetailsIngredientsModelFromJson(
        Map<String, dynamic> json) =>
    DishDetailsIngredientsModel(
      vegetables: (json['vegetables'] as List<dynamic>?)
          ?.map((e) => DishDetailsIngredientsSpiceModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      spices: (json['spices'] as List<dynamic>?)
          ?.map((e) => DishDetailsIngredientsSpiceModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      appliances: (json['appliances'] as List<dynamic>?)
          ?.map((e) => DishDetailsIngredientsAppliancesModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DishDetailsIngredientsModelToJson(
        DishDetailsIngredientsModel instance) =>
    <String, dynamic>{
      'vegetables': instance.vegetables,
      'spices': instance.spices,
      'appliances': instance.appliances,
    };
