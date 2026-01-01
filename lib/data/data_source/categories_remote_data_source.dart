import 'package:the_meal/core/api_result/api_result.dart';
import 'package:the_meal/domain/entites/meal_cat_response_entity.dart';
import 'package:the_meal/domain/entites/meals_details_response_entity.dart';
import 'package:the_meal/domain/entites/meals_entity.dart';


abstract interface class CategoriesRemoteDataSource {
  Future<ApiResult<MealCatResponseEntity>> getMealsCategories();

  Future<ApiResult<MealsResponseEntity>> getMeals(String id);

  Future<ApiResult<MealDetailsResponseEntity>> getMealsDetails(String id);

}
