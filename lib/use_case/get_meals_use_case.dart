import 'package:injectable/injectable.dart';
import 'package:the_meal/core/api_result/api_result.dart';
import 'package:the_meal/domain/entites/meals_entity.dart';
import 'package:the_meal/domain/repo/categories_repo.dart';
@injectable
class GetMealsUseCase {
  CategoriesRepo categoriesRepo;
  GetMealsUseCase(this.categoriesRepo);
  Future<ApiResult<MealsResponseEntity>> call(String id) async{
    return  await categoriesRepo.getMeals(id);
  }
}
