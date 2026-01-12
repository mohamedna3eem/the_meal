import 'package:injectable/injectable.dart';
import 'package:the_meal/core/Failure/network_exeption.dart';
import 'package:the_meal/core/result/result.dart';
import 'package:the_meal/domain/entites/meals_entity.dart';
import 'package:the_meal/domain/repo/categories_repo.dart';
@injectable
class GetMealsUseCase {
  CategoriesRepo categoriesRepo;
  GetMealsUseCase(this.categoriesRepo);
  Future<Result<MealsResponseEntity,NetworkException>> call(String id) async{
    return  await categoriesRepo.getMeals(id);
  }
}
