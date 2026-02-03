import 'package:json_annotation/json_annotation.dart';
import 'package:the_meal/api/models/meal_categories/meal_cat.dart';
import 'package:the_meal/domain/entites/meal_cat_response_entity.dart';
part 'meal_cat_response.g.dart';

@JsonSerializable()
class MealCatResponseDto {
  @JsonKey(name: "categories")
  final List<CategoriesDto>? categories;

  MealCatResponseDto({this.categories});

  factory MealCatResponseDto.fromJson(Map<String, dynamic> json) {
    return _$MealCatResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MealCatResponseDtoToJson(this);
  }

  MealCatResponseEntity toEntity() {
    return MealCatResponseEntity(
      categories: categories?.map((dto) => dto.toEntity()).toList() ?? [],
    );
  }
}
