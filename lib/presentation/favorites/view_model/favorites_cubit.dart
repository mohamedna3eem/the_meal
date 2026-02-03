import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:the_meal/api/models/favorite/favorite.dart';
import 'package:the_meal/core/Failure/network_exeption.dart';
import 'package:the_meal/core/loading/loading_states.dart';
import 'package:the_meal/domain/repo/favorite_repo.dart';
import 'package:the_meal/presentation/favorites/view_model/favorites_state.dart';

@injectable
class FavoritesCubit extends Cubit<FavoritesState> {
  final FavoritesRepo _repo;

  FavoritesCubit(this._repo) : super(FavoritesInitial());

  List<FavoriteMeal> favorites = [];
  LoadingState loading = Loading();


  Future<void> loadFavorites() async {
    try {
      loading = Loading();
      emit(FavoritesLoading());

      final items = await _repo.getFavorites();
          loading = LoadingSuccess(data: favorites);
          emit(FavoritesResult());
          loading = LoadingException( UnknownException());
          emit(FavoritesResult());




      loading = LoadingSuccess(data: items);
      emit(FavoritesLoaded());
    } catch (e) {
      loading = LoadingSuccess();
      emit(FavoritesResult());
    }
  }

  Future<void> toggleFavorite(FavoriteMeal meal) async {
    try {
      await _repo.toggleFavorite(meal);

      if (favorites.any((m) => m.id == meal.id)) {
        favorites.removeWhere((m) => m.id == meal.id);
      } else {
        favorites.add(meal);
      }

      emit(FavoritesLoaded());
    } catch (e) {
      loading = LoadingSuccess();
      emit(FavoritesResult());
    }
  }
  bool isFavorite(String id) => favorites.any((m) => m.id == id);
}
