import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:the_meal/api/models/favorite/favorite.dart';
import 'package:the_meal/core/Failure/network_exeption.dart';
import 'package:the_meal/core/result/result.dart';
import 'package:the_meal/domain/repo/favorite_repo.dart';

@LazySingleton(as: FavoritesRepo)
class FavoritesRepoImpl implements FavoritesRepo {
  final Box<Map> box;
  FavoritesRepoImpl(this.box);

  @override
  Future<Result<void, NetworkException>> toggleFavorite(
    FavoriteMeal meal,
  ) async {
    if (box.containsKey(meal.id)) {
      await box.delete(meal.id);
    } else {
      await box.put(meal.id, {
        'id': meal.id,
        'name': meal.name,
        'imageUrl': meal.imageUrl,
      });
    }
    {
      return Failure(UnknownException());
    }
  }

  @override
  Future<List<Result<FavoriteMeal, NetworkException>>> getFavorites() async {
    try {
      final values = box.values.cast<Map>().toList();

      final items = values
          .map(
            (m) => FavoriteMeal(
              id: m['id'] as String,
              name: m['name'] as String,
              imageUrl: m['imageUrl'] as String,
            ),
          )
          .toList();

      return items as List<Result<FavoriteMeal, NetworkException>>;
    } catch (e) {
      return [Failure(UnknownException())];
    }
  }



  @override
  Future<Result<bool, NetworkException>> isFavorite(String id) async {
    try {
      final exists = box.containsKey(id);
      return Success(exists);
    } catch (_) {
      return Failure(UnknownException());
    }
  }

}
// import 'package:hive/hive.dart';
// import 'package:injectable/injectable.dart';
// import 'package:the_meal/api/models/favorite/favorite.dart';
// import 'package:the_meal/core/Failure/network_exeption.dart';
// import 'package:the_meal/core/result/result.dart';
// import 'package:the_meal/domain/repo/favorite_repo.dart';
//
// @LazySingleton(as: FavoritesRepo)
// class FavoritesRepoImpl implements FavoritesRepo {
//   final Box<Map> box;
//   FavoritesRepoImpl(this.box);
//
//   @override
//   Future<Result<void, NetworkException>> toggleFavorite(FavoriteMeal meal) async {
//     try {
//       if (box.containsKey(meal.id)) {
//         await box.delete(meal.id);
//       } else {
//         await box.put(meal.id, {
//           'id': meal.id,
//           'name': meal.name,
//           'imageUrl': meal.imageUrl,
//         });
//       }
//       return const Success(null);  // نجاح بدون قيمة
//     } catch (e) {
//       return Failure(UnknownException());
//     }
//   }
//
//   @override
//   Future<List<FavoriteMeal>> getFavorites() async {
//     try {
//       final values = box.values.cast<Map>().toList();
//       final items = values.map((m) => FavoriteMeal(
//         id: m['id'] as String,
//         name: m['name'] as String,
//         imageUrl: m['imageUrl'] as String,
//       )).toList();
//       return items;
//     } catch (e) {
//       return [];  // قائمة فاضية في حالة خطأ
//     }
//   }
//
//   @override
//   Future<Result<bool, NetworkException>> isFavorite(String id) async {
//     try {
//       return Success(box.containsKey(id));
//     } catch (e) {
//       return Failure(UnknownException());
//     }
//   }
// }