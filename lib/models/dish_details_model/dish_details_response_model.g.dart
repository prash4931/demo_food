// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishDetailsResponseModel _$DishDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    DishDetailsResponseModel(
      name: json['name'] as String?,
      id: json['id'] as int?,
      timeToPrepare: json['timeToPrepare'] as String?,
      ingredients: json['ingredients'] == null
          ? null
          : DishDetailsIngredientsModel.fromJson(
              json['ingredients'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DishDetailsResponseModelToJson(
        DishDetailsResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'timeToPrepare': instance.timeToPrepare,
      'ingredients': instance.ingredients,
    };
