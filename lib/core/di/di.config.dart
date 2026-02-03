// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:hive/hive.dart' as _i979;
import 'package:injectable/injectable.dart' as _i526;

import '../../api/client/api_client.dart' as _i508;
import '../../data/repo/categories_repo_impl.dart' as _i591;
import '../../data/repo/favorites_repo_impl.dart' as _i24;
import '../../domain/repo/categories_repo.dart' as _i969;
import '../../domain/repo/favorite_repo.dart' as _i980;
import '../../presentation/favorites/view_model/favorites_cubit.dart' as _i915;
import '../../presentation/meals/view_model/meals_view_model.dart' as _i487;
import '../../presentation/meals_categories/view_model/categories_view_model.dart'
    as _i1070;
import '../../presentation/meals_details/view_model/meals_details_view_model.dart'
    as _i700;
import '../../use_case/category_meal_use_case.dart' as _i937;
import '../../use_case/get_meals_details_use_case.dart' as _i499;
import '../../use_case/get_meals_use_case.dart' as _i606;
import '../dio/dio_module.dart' as _i977;
import 'hive_module.dart' as _i576;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final hiveModule = _$HiveModule();
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i979.Box<Map<dynamic, dynamic>>>(
      () => hiveModule.favoritesBox,
      preResolve: true,
    );
    await gh.lazySingletonAsync<_i361.Dio>(
      () => registerModule.dio(),
      preResolve: true,
    );
    gh.lazySingleton<_i980.FavoritesRepo>(
      () => _i24.FavoritesRepoImpl(gh<_i979.Box<Map<dynamic, dynamic>>>()),
    );
    gh.factory<_i508.ApiClient>(() => _i508.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i915.FavoritesCubit>(
      () => _i915.FavoritesCubit(gh<_i980.FavoritesRepo>()),
    );
    gh.factory<_i969.CategoriesRepo>(
      () => _i591.CategoriesRepoImpl(gh<_i508.ApiClient>()),
    );
    gh.factory<_i937.CategoryMealUseCase>(
      () => _i937.CategoryMealUseCase(gh<_i969.CategoriesRepo>()),
    );
    gh.factory<_i499.GetMealsDetailsUseCase>(
      () => _i499.GetMealsDetailsUseCase(gh<_i969.CategoriesRepo>()),
    );
    gh.factory<_i606.GetMealsUseCase>(
      () => _i606.GetMealsUseCase(gh<_i969.CategoriesRepo>()),
    );
    gh.factoryParam<_i487.MealsCubit, String, dynamic>(
      (id, _) => _i487.MealsCubit(gh<_i606.GetMealsUseCase>(), id),
    );
    gh.factory<_i1070.CategoriesCubit>(
      () => _i1070.CategoriesCubit(gh<_i937.CategoryMealUseCase>()),
    );
    gh.factoryParam<_i700.MealsDetailsCubit, String, dynamic>(
      (id, _) =>
          _i700.MealsDetailsCubit(gh<_i499.GetMealsDetailsUseCase>(), id),
    );
    return this;
  }
}

class _$HiveModule extends _i576.HiveModule {}

class _$RegisterModule extends _i977.RegisterModule {}
