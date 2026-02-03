import 'package:injectable/injectable.dart';
import 'package:the_meal/api/models/meal_categories/meal_cat_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:the_meal/api/models/meal_details/meal_details_response_dto.dart';
import 'package:the_meal/api/models/meals/meals_response_dto.dart';
import 'package:the_meal/core/constans/end_points.dart';
part 'api_client.g.dart';

@RestApi(baseUrl:EndPoints.baseUrl)
@injectable
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(EndPoints.getAllCat)
  Future<MealCatResponseDto> getAllCat();
  @GET(EndPoints.getMealId)
  Future<MealsResponseDto> getMealId(@Query("c") String mealId);
  @GET(EndPoints.getMealById)
  Future<MealDetailsResponseDto> getMealById(@Query("i") String mealId);
}
