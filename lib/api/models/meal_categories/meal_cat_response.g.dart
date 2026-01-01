// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_cat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealCatResponseDto _$MealCatResponseDtoFromJson(Map<String, dynamic> json) =>
    MealCatResponseDto(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoriesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealCatResponseDtoToJson(MealCatResponseDto instance) =>
    <String, dynamic>{'categories': instance.categories};
