import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_meal/core/api_result/api_result.dart';
import 'package:the_meal/core/failure.dart';
import 'package:the_meal/core/loading/loading_states.dart';
import 'package:the_meal/domain/entites/meals_details_response_entity.dart';
import 'package:the_meal/presentation/meals_details/view_model/meals_details_states.dart';
import 'package:the_meal/use_case/get_meals_details_use_case.dart';

@injectable
class MealsDetailsCubit extends Cubit<MealsDetailsState> {
  final GetMealsDetailsUseCase getMealsDetailsUseCase;
  final String id;

  MealsDetailsCubit(this.getMealsDetailsUseCase, @factoryParam this.id)
    : super(MealsDetailsInitial() ) {
    loadMealsDetails();
  }

  MealsDetailsEntity? meal;
  String? imageUrl;
  LoadingState loading = Loading();

  Future<void> loadMealsDetails() async {
    loading = Loading();
     emit( MealsDetailsLoading());

    final result = await getMealsDetailsUseCase(id);

    switch (result) {
      case ApiSuccessResult<MealDetailsResponseEntity>():
        final m = result.data.meals!.first;
        meal = m;

        imageUrl = (m.strMealThumb.isNotEmpty)
            ? m.strMealThumb
            : null;


          loading =LoadingSuccess(data: meal);
         emit(MealsDetailsResalt(message: ""));

      case ApiErrorResult<MealDetailsResponseEntity>():
       loading= LoadingException(NetworkFailure());
         emit( MealsDetailsResalt(message: "on data",success: false));

    }
  }
}
