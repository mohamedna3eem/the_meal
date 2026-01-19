import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_meal/api/models/meals/meals_dto.dart';
import 'package:the_meal/core/loading/loading_widgit.dart';
import 'package:the_meal/core/router/routes_name.dart';
import 'package:the_meal/presentation/meals/view/widget/meals_card.dart';
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
                return MealsCard(
                  imageUrl: imageUrl,
                  mealId: mealId,
                  meal: meal,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
