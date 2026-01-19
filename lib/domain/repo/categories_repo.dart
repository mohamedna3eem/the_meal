import 'package:the_meal/core/Failure/network_exeption.dart';
import 'package:the_meal/core/result/result.dart';
import 'package:the_meal/domain/entites/meal_cat_response_entity.dart';
import 'package:the_meal/domain/entites/meals_details_response_entity.dart';
import 'package:the_meal/domain/entites/meals_entity.dart';

abstract interface class CategoriesRepo {
  Future<Result<MealCatResponseEntity, NetworkException>> getMealsCategories();
  Future<Result<MealsResponseEntity, NetworkException>> getMeals(String id);
  Future<Result<MealDetailsResponseEntity, NetworkException>> getMealsDetails(
    String id,
  );
}
