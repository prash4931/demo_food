// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dish_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DishModel _$DishModelFromJson(Map<String, dynamic> json) => DishModel(
      name: json['name'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      description: json['description'] as String?,
      equipments: (json['equipments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      image: json['image'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$DishModelToJson(DishModel instance) => <String, dynamic>{
      'name': instance.name,
      'rating': instance.rating,
      'description': instance.description,
      'equipments': instance.equipments,
      'image': instance.image,
      'id': instance.id,
    };
