import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_meal/api/models/favorite/favorite.dart';
import 'package:the_meal/core/router/routes_name.dart';
import 'package:the_meal/domain/entites/meals_entity.dart';

import 'package:the_meal/presentation/favorites/view_model/favorites_cubit.dart';
import 'package:the_meal/presentation/favorites/view_model/favorites_state.dart';

class MealsCard extends StatelessWidget {
  final String imageUrl;
  final String mealId;
  final MealsEntity meal;

  const MealsCard({
    super.key,
    required this.imageUrl,
    required this.mealId,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.mealsDetailsScreen,
                arguments: mealId,
              );
            },

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Icon(Icons.broken_image, size: 48)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    meal.strMeal,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: BlocBuilder<FavoritesCubit, FavoritesState>(
              builder: (context, state) {
                final favCubit = context.read<FavoritesCubit>();
                final isFav = favCubit.isFavorite(meal.idMeal);

                return GestureDetector(
                  onTap: () {
                    favCubit.toggleFavorite(
                      FavoriteMeal(
                        id: meal.idMeal,
                        name: meal.strMeal,
                        imageUrl: meal.strMealThumb,
                      ),
                    );
                  },
                  child: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}
