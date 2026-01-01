import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_meal/core/api_result/api_result.dart';
import 'package:the_meal/domain/entites/meals_entity.dart';
import 'package:the_meal/presentation/meals/view_model/meals_states.dart';
import 'package:the_meal/use_case/get_meals_use_case.dart';

@injectable
class MealsCubit extends Cubit<MealsState> {
  final GetMealsUseCase getMealsUseCase;
  final String id;

  MealsCubit(this.getMealsUseCase, @factoryParam this.id)
    : super(const MealsInitial()) {
    loadMeals(id);
  }

  Future<void> loadMeals(String id) async {
    emit(const MealsLoading());

    final result = await getMealsUseCase(id);

    switch (result){
      case ApiSuccessResult<MealsResponseEntity>():
        emit(MealsResalt(message: "",data: result.data));
      case ApiErrorResult<MealsResponseEntity>():
        emit(MealsResalt(message: result.errorMessage, success: false));
    }


  }
}
