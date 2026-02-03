import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_meal/core/loading/loading_widgit.dart';
import 'package:the_meal/domain/entites/meals_entity.dart';
import 'package:the_meal/presentation/favorites/view_model/favorites_cubit.dart';
import 'package:the_meal/presentation/favorites/view_model/favorites_state.dart';
import 'package:the_meal/presentation/meals/view/widget/meals_card.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<FavoritesCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text("Favorites")),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          return LoadingWidget(
            loadingState: cubit.loading,
            onRetry: cubit.loadFavorites,
            child: ListView.builder(
              itemCount: cubit.favorites.length,
              itemBuilder: (context, index) {
                final fav = cubit.favorites[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: SizedBox(
                    height: 250,
                    child: MealsCard(
                      imageUrl: fav.imageUrl,
                      mealId: fav.id,
                      meal: MealsEntity(
                        strMeal: fav.name,
                        strMealThumb: fav.imageUrl,
                        idMeal: fav.id,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
