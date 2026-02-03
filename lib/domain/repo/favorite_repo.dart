import 'package:the_meal/api/models/favorite/favorite.dart';
import 'package:the_meal/core/Failure/network_exeption.dart';
import 'package:the_meal/core/result/result.dart';

abstract interface class FavoritesRepo {
  Future<Result<void,NetworkException>> toggleFavorite(FavoriteMeal favorite);
  Future<List<Result<FavoriteMeal,NetworkException>>> getFavorites();
  Future<Result<bool,NetworkException>> isFavorite(String id);
}
