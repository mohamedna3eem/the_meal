import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_meal/core/api_result/api_result.dart';
import 'package:the_meal/domain/entites/meal_cat_response_entity.dart';
import 'package:the_meal/use_case/category_meal_use_case.dart';
import 'categories_states.dart';


@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryMealUseCase getCategoriesUseCase;
  CategoriesCubit(this.getCategoriesUseCase) : super(const CategoriesInitial()){
    loadCategories();
  }

  Future<void> loadCategories() async {
    emit(const CategoriesLoading());

    final result = await getCategoriesUseCase();

   switch (result){
     case ApiSuccessResult<MealCatResponseEntity>():
       emit(CategoriesResalt(message: "",data: result.data));
     case ApiErrorResult<MealCatResponseEntity>():
       emit(CategoriesResalt(message: result.errorMessage, success: false));
   }
  }
}
