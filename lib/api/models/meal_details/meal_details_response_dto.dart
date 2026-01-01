import 'package:json_annotation/json_annotation.dart';
import 'package:the_meal/api/models/meal_details/meals_details_dto.dart';
import 'package:the_meal/domain/entites/meals_details_response_entity.dart';

part 'meal_details_response_dto.g.dart';

@JsonSerializable()
class MealDetailsResponseDto {
  @JsonKey(name: "meals")
  final List<MealsDetailsDto>? meals;

  MealDetailsResponseDto ({
    this.meals,
  });

  factory MealDetailsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$MealDetailsResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MealDetailsResponseDtoToJson(this);
  }
   MealDetailsResponseEntity toEntity(){
    return MealDetailsResponseEntity(
      meals: meals?.map((dto)=>dto.toEntity()).toList()??[]
    );
   }
}




