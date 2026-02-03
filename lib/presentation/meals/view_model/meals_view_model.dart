import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_meal/core/loading/loading_states.dart';
import 'package:the_meal/domain/entites/meals_entity.dart';
import 'package:the_meal/presentation/meals/view_model/meals_states.dart';
import 'package:the_meal/use_case/get_meals_use_case.dart';

@injectable
class MealsCubit extends Cubit<MealsState> {
  final GetMealsUseCase getMealsUseCase;
  final String id;

  MealsCubit(this.getMealsUseCase, @factoryParam this.id)
    : super(MealsInitial()) {
    loadMeals();
  }

  List<MealsEntity> mealsList = [];
  LoadingState loading = Loading();

  Future<void> loadMeals() async {
    loading = Loading();
    emit(MealsLoading());

    final result = await getMealsUseCase(id);
    result.fold(
      onSuccess: (data) {
        mealsList = data.meals;
        loading = LoadingSuccess(data: data);
        emit(MealsResalt());
      },
      onFailure: (e) {
        loading = LoadingException(e);
        emit(MealsResalt());
      },
    );
  }
}
