import 'package:injectable/injectable.dart';
import 'package:the_meal/core/Failure/network_exeption.dart';
import 'package:the_meal/core/result/result.dart';
import 'package:the_meal/domain/entites/meal_cat_response_entity.dart';
import 'package:the_meal/domain/repo/categories_repo.dart';
@injectable
class CategoryMealUseCase {
  CategoriesRepo categoriesRepo;
  CategoryMealUseCase(this.categoriesRepo);
  Future<Result<MealCatResponseEntity,NetworkException>> call() async{
    return  await categoriesRepo.getMealsCategories();
  }
}
