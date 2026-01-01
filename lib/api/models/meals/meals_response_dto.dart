import 'package:json_annotation/json_annotation.dart';
import 'package:the_meal/api/models/meals/meals_dto.dart';
import 'package:the_meal/domain/entites/meals_entity.dart';

part 'meals_response_dto.g.dart';

@JsonSerializable()
class MealsResponseDto {
  @JsonKey(name: "meals")
  final List<Meals>? meals;
  MealsResponseDto ({
    this.meals,
  });
  factory MealsResponseDto.fromJson(Map<String, dynamic> json) {
    return _$MealsResponseDtoFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$MealsResponseDtoToJson(this);
  }
  MealsResponseEntity toEntity(){
    return MealsResponseEntity(
      meals: meals?.map((dto)=>dto.toEntity()).toList()?? [] ,
    );
  }
}




