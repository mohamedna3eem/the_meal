import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_meal/core/api_result/api_result.dart';
import 'package:the_meal/domain/entites/meals_details_response_entity.dart';
import 'package:the_meal/presentation/meals_details/view_model/meals_details_states.dart';
import 'package:the_meal/use_case/get_meals_details_use_case.dart';

@injectable
class MealsDetailsCubit extends Cubit<MealsDetailsState> {
  final GetMealsDetailsUseCase getMealsDetailsUseCase;
  final String id;
  MealsDetailsCubit(this.getMealsDetailsUseCase, @factoryParam this.id)
    : super(const MealsDetailsInitial()) {
    loadMealsDetails(id);
  }

  Future<void> loadMealsDetails(String id) async {
    emit(const MealsDetailsLoading());

    final result = await getMealsDetailsUseCase(id);

    switch (result){
      case ApiSuccessResult<MealDetailsResponseEntity>():
        emit(MealsDetailsResalt(message: "",data: result.data));
      case ApiErrorResult<MealDetailsResponseEntity>():
        emit(MealsDetailsResalt(message: result.errorMessage, success: false));
    }


  }
}
