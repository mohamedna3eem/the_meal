import 'package:injectable/injectable.dart';
import 'package:the_meal/api/client/api_client.dart';
import 'package:the_meal/core/Failure/network_exeption.dart';
import 'package:the_meal/core/result/result.dart';
import 'package:the_meal/domain/entites/meal_cat_response_entity.dart';
import 'package:the_meal/domain/entites/meals_details_response_entity.dart';
import 'package:the_meal/domain/entites/meals_entity.dart';
import 'package:the_meal/domain/repo/categories_repo.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl implements CategoriesRepo {
  final ApiClient apiClient;

  CategoriesRepoImpl(this.apiClient);

  @override
  Future<Result<MealCatResponseEntity, NetworkException>>
  getMealsCategories() async {
    return safeApiCall(
      () => apiClient.getAllCat(),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<Result<MealsResponseEntity, NetworkException>> getMeals(
    String id,
  ) async {
    return safeApiCall(
      () => apiClient.getMealId(id),
      (response) => response.toEntity(),
    );
  }

  @override
  Future<Result<MealDetailsResponseEntity, NetworkException>> getMealsDetails(
    String id,
  ) async {
    return safeApiCall(
      () => apiClient.getMealById(id),
      (response) => response.toEntity(),
    );
  }
}
