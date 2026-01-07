import 'package:injectable/injectable.dart';
import 'package:the_meal/api/client/api_client.dart';
import 'package:the_meal/core/api_result/api_result.dart';
import 'package:the_meal/domain/entites/meal_cat_response_entity.dart';
import 'package:the_meal/domain/entites/meals_details_response_entity.dart';
import 'package:the_meal/domain/entites/meals_entity.dart';
import '../../data/data_source/categories_remote_data_source.dart';

@Injectable(as: CategoriesRemoteDataSource)
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final ApiClient apiClient;

  CategoriesRemoteDataSourceImpl(this.apiClient);

  @override
  Future<ApiResult<MealCatResponseEntity>> getMealsCategories() async {

   return safeApiCall(
           () => apiClient.getAllCat() ,
       (response)=> response.toEntity()
   );


  }

  @override
  Future<ApiResult<MealsResponseEntity>> getMeals(String id)async {
    return safeApiCall(
            () => apiClient.getMealId(id) ,
            (response)=> response.toEntity()
    );
  }



  @override
  Future<ApiResult<MealDetailsResponseEntity>>
  getMealsDetails(String id)async {
    return
      safeApiCall(
              () => apiClient.getMealById(id) ,
              (response)=> response.toEntity()
      );
  }


}
