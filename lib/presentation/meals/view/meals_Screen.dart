import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_meal/core/loading/loading_widgit.dart';
import 'package:the_meal/core/router/routes_name.dart';
import 'package:the_meal/presentation/meals/view_model/meals_states.dart';
import 'package:the_meal/presentation/meals/view_model/meals_view_model.dart';

class MealsScreen extends StatelessWidget {
  final String categoryName;

  const MealsScreen({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('$categoryName Meals'), centerTitle: true),
      body: BlocBuilder<MealsCubit, MealsState>(
        builder: (context, state) {
          final cubit = context.read<MealsCubit>();
          final mealsList = cubit.mealsList;
          return LoadingWidget(
            loadingState: cubit.loading,
            onRetry: () => cubit.loadMeals(),
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: mealsList.length,
              itemBuilder: (context, index) {
                final meal = mealsList[index];
                final imageUrl = meal.strMealThumb;
                final mealId = meal.idMeal;

                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: InkWell(
                    onTap: () {
                      if (mealId.isNotEmpty) {
                        Navigator.pushNamed(
                          context,
                          RouteNames.mealsDetailsScreen,
                          arguments: mealId,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Invalid meal id')),
                        );
                      }
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
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              );
                            },
                            errorBuilder: (context, error, stackTrace) =>
                                const Center(
                                  child: Icon(Icons.broken_image, size: 48),
                                ),
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
                );
              },
            ),
          );
        },
      ),
    );
  }
}
