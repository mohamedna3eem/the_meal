import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_meal/core/loading/loading_states.dart';
import 'package:the_meal/domain/entites/meal_cat_response_entity.dart';
import 'package:the_meal/use_case/category_meal_use_case.dart';
import 'categories_states.dart';

@injectable
class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoryMealUseCase getCategoriesUseCase;

  CategoriesCubit(this.getCategoriesUseCase)
    : super(const CategoriesInitial()) {
    loadCategories();
  }

  LoadingState loading = Loading();

  List<CategoriesEntity> categories = [];

  Future<void> loadCategories() async {
    loading = Loading();
    emit(const CategoriesLoading());

    final result = await getCategoriesUseCase();
    result.fold(
      onSuccess: (data) {
        categories = data.categories;
        loading = LoadingSuccess(data: data);
        emit(CategoriesResalt());
      },
      onFailure: (e) {
        loading = LoadingException(e);
        emit(CategoriesResalt());
      },
    );
  }
}
