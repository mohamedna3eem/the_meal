import 'package:injectable/injectable.dart';
import 'package:the_meal/core/Failure/network_exeption.dart';
import 'package:the_meal/core/result/result.dart';
import 'package:the_meal/domain/entites/meals_details_response_entity.dart';
import 'package:the_meal/domain/repo/categories_repo.dart';
@injectable
class GetMealsDetailsUseCase {
  CategoriesRepo categoriesRepo;
  GetMealsDetailsUseCase(this.categoriesRepo);
  Future<Result<MealDetailsResponseEntity,NetworkException>> call(String id) async{
    return  await categoriesRepo.getMealsDetails(id);
  }
}
