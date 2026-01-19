import 'package:injectable/injectable.dart';
import 'package:the_meal/api/models/meal_categories/meal_cat_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:the_meal/api/models/meal_details/meal_details_response_dto.dart';
import 'package:the_meal/api/models/meals/meals_response_dto.dart';
part 'api_client.g.dart';

@RestApi(baseUrl: 'https://www.themealdb.com/api/json/v1/1/')
@injectable
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET("categories.php")
  Future<MealCatResponseDto> getAllCat();
  @GET("filter.php")
  Future<MealsResponseDto> getMealId(@Query("c") String mealId);
  @GET("lookup.php")
  Future<MealDetailsResponseDto> getMealById(@Query("i") String mealId);
}
