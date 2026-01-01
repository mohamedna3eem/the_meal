import 'package:injectable/injectable.dart';
import 'package:the_meal/core/api_result/api_result.dart';

import 'package:the_meal/data/data_source/categories_remote_data_source.dart';
import 'package:the_meal/domain/entites/meal_cat_response_entity.dart';
import 'package:the_meal/domain/entites/meals_details_response_entity.dart';
import 'package:the_meal/domain/entites/meals_entity.dart';

import '../../domain/repo/categories_repo.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  CategoriesRemoteDataSource categoriesRemoteDataSource;

  CategoriesRepoImpl(this.categoriesRemoteDataSource);

  @override
  Future<ApiResult<MealCatResponseEntity>> getMealsCategories() async {
    return categoriesRemoteDataSource.getMealsCategories();
  }

  @override
  Future<ApiResult<MealsResponseEntity>> getMeals(String id) async {
    return categoriesRemoteDataSource.getMeals(id);
  }

  @override
  Future<ApiResult<MealDetailsResponseEntity>> getMealsDetails(
    String id,
  ) async {
    return categoriesRemoteDataSource.getMealsDetails(id);
  }
}
