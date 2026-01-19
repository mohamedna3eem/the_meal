import 'package:json_annotation/json_annotation.dart';
import 'package:the_meal/domain/entites/meal_cat_response_entity.dart';

part 'meal_cat.g.dart';

@JsonSerializable()
class CategoriesDto {
  @JsonKey(name: "idCategory")
  final String? idCategory;
  @JsonKey(name: "strCategory")
  final String? strCategory;
  @JsonKey(name: "strCategoryThumb")
  final String? strCategoryThumb;
  @JsonKey(name: "strCategoryDescription")
  final String? strCategoryDescription;

  CategoriesDto({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory CategoriesDto.fromJson(Map<String, dynamic> json) {
    return _$CategoriesDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoriesDtoToJson(this);
  }

  CategoriesEntity toEntity() {
    return CategoriesEntity(
      idCategory: idCategory ?? "",
      strCategory: strCategory ?? "",
      strCategoryDescription: strCategoryDescription ?? "",
      strCategoryThumb: strCategoryThumb ?? "",
    );
  }
}
