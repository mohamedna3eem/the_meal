import 'package:json_annotation/json_annotation.dart';
import 'package:the_meal/domain/entites/meals_entity.dart';
part 'meals_dto.g.dart';

@JsonSerializable()
class Meals {
  @JsonKey(name: "strMeal")
  final String? strMeal;
  @JsonKey(name: "strMealThumb")
  final String? strMealThumb;
  @JsonKey(name: "idMeal")
  final String? idMeal;

  Meals({this.strMeal, this.strMealThumb, this.idMeal});

  factory Meals.fromJson(Map<String, dynamic> json) {
    return _$MealsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MealsToJson(this);
  }

  MealsEntity toEntity() {
    return MealsEntity(
      strMealThumb: strMealThumb ?? "",
      strMeal: strMeal ?? "",
      idMeal: idMeal ?? "",
    );
  }
}
