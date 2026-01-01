import 'package:the_meal/domain/entites/meal_cat_response_entity.dart';

abstract class CategoriesState {
  const CategoriesState();
}

class CategoriesInitial extends CategoriesState {
  const CategoriesInitial();
}

class CategoriesLoading extends CategoriesState {
  const CategoriesLoading();
}

class CategoriesResalt extends CategoriesState {
  final MealCatResponseEntity? data;
  final String message ;
  final bool success;
  const CategoriesResalt({this.data, required this.message , this.success =true});
}

