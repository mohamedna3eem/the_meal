// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_details_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealDetailsResponseDto _$MealDetailsResponseDtoFromJson(
  Map<String, dynamic> json,
) => MealDetailsResponseDto(
  meals: (json['meals'] as List<dynamic>?)
      ?.map((e) => MealsDetailsDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MealDetailsResponseDtoToJson(
  MealDetailsResponseDto instance,
) => <String, dynamic>{'meals': instance.meals};
