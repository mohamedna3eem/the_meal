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
  List<Map<String, String>> ingredients = [];
  LoadingState loading = Loading();

  Future<void> loadMealsDetails() async {
    loading = Loading();
     emit( MealsDetailsLoading());

    final result = await getMealsDetailsUseCase(id);

    switch (result) {
      case ApiSuccessResult<MealDetailsResponseEntity>():
        final m = result.data.meals!.first;
        meal = m;

        imageUrl = (m.strMealThumb != null && m.strMealThumb!.isNotEmpty)
            ? m.strMealThumb
            : null;

        ingredients =
            [
                  {'ingredient': m.strIngredient1, 'measure': m.strMeasure1},
                  {'ingredient': m.strIngredient2, 'measure': m.strMeasure2},
                  {'ingredient': m.strIngredient3, 'measure': m.strMeasure3},
                  {'ingredient': m.strIngredient4, 'measure': m.strMeasure4},
                  {'ingredient': m.strIngredient5, 'measure': m.strMeasure5},
                  {'ingredient': m.strIngredient6, 'measure': m.strMeasure6},
                  {'ingredient': m.strIngredient7, 'measure': m.strMeasure7},
                  {'ingredient': m.strIngredient8, 'measure': m.strMeasure8},
                  {'ingredient': m.strIngredient9, 'measure': m.strMeasure9},
                  {'ingredient': m.strIngredient10, 'measure': m.strMeasure10},
                  {'ingredient': m.strIngredient11, 'measure': m.strMeasure11},
                  {'ingredient': m.strIngredient12, 'measure': m.strMeasure12},
                  {'ingredient': m.strIngredient13, 'measure': m.strMeasure13},
                  {'ingredient': m.strIngredient14, 'measure': m.strMeasure14},
                  {'ingredient': m.strIngredient15, 'measure': m.strMeasure15},
                  {'ingredient': m.strIngredient16, 'measure': m.strMeasure16},
                  {'ingredient': m.strIngredient17, 'measure': m.strMeasure17},
                  {'ingredient': m.strIngredient18, 'measure': m.strMeasure18},
                  {'ingredient': m.strIngredient19, 'measure': m.strMeasure19},
                  {'ingredient': m.strIngredient20, 'measure': m.strMeasure20},
                ]
                .where(
                  (e) =>
                      e['ingredient'] != null &&
                      e['ingredient']!.trim().isNotEmpty,
                )
                .map(
                  (e) => {
                    'ingredient': e['ingredient']!,
                    'measure': e['measure'] ?? '',
                  },
                )
                .toList();
          loading =LoadingSuccess(data: meal);
         emit(MealsDetailsResalt(message: "",success: true,data: result.data));

      case ApiErrorResult<MealDetailsResponseEntity>():
       loading= LoadingException(NetworkFailure());
         emit( MealsDetailsResalt(message: "on data"));

    }
  }
}
