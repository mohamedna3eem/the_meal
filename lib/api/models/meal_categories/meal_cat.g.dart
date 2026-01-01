// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_cat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesDto _$CategoriesDtoFromJson(Map<String, dynamic> json) =>
    CategoriesDto(
      idCategory: json['idCategory'] as String?,
      strCategory: json['strCategory'] as String?,
      strCategoryThumb: json['strCategoryThumb'] as String?,
      strCategoryDescription: json['strCategoryDescription'] as String?,
    );

Map<String, dynamic> _$CategoriesDtoToJson(CategoriesDto instance) =>
    <String, dynamic>{
      'idCategory': instance.idCategory,
      'strCategory': instance.strCategory,
      'strCategoryThumb': instance.strCategoryThumb,
      'strCategoryDescription': instance.strCategoryDescription,
    };
