import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_meal/core/loading/loading_widgit.dart';
import 'package:the_meal/presentation/meals_details/view_model/meals_details_states.dart';
import 'package:the_meal/presentation/meals_details/view_model/meals_details_view_model.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MealsDetailsCubit, MealsDetailsState>(
        builder: (context, state) {
          final cubit = context.read<MealsDetailsCubit>();

          final meal = cubit.meal;
          final imageUrl = cubit.imageUrl;
          final ingredients = meal?.ingredients;
          return LoadingWidget(
            loadingState: cubit.loading,
            onRetry: () => cubit.loadMealsDetails(),
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                SliverAppBar(
                  expandedHeight: 300,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    background: imageUrl != null
                        ? Image.network(imageUrl, fit: BoxFit.cover)
                        : const Icon(Icons.broken_image, size: 100),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          meal?.strMeal ?? 'Unknown Meal',
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(height: 40),
                        const Text(
                          'Ingredients',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (meal == null)
                          SizedBox()
                        else
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: meal.ingredients.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 6),
                            itemBuilder: (_, i) {
                              final item = ingredients?[i];
                              return ListTile(
                                leading: const Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                ),
                                title: Text(
                                  '${item?['measure']} ${item?['ingredient']}',
                                ),
                              );
                            },
                          ),
                        const Divider(height: 40),
                        Text(meal?.strMeal ?? 'No instructions available.'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
