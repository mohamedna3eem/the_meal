import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_meal/core/app_dialog/app_dialog.dart';
import 'package:the_meal/presentation/meals_details/view_model/meals_details_states.dart';
import 'package:the_meal/presentation/meals_details/view_model/meals_details_view_model.dart';

class MealDetailsScreen extends StatelessWidget {
  final String mealId;
  const MealDetailsScreen({super.key, required this.mealId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<MealsDetailsCubit, MealsDetailsState>(
        listener: (context, state) {
          if (state is MealsDetailsResalt && !state.success) {
            AppDialog(
              message: state.message.isNotEmpty ? state.message : 'Failed to load meal details',
            ).show(context);
          }
        },
        builder: (context, state) {
          if (state is MealsDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is MealsDetailsResalt) {
            if (!state.success ||
                state.data?.meals == null ||
                state.data!.meals!.isEmpty) {
               AppDialog(message:  state.message,).show(context);
            }

            final meal = state.data!.meals!.first;
            final imageUrl = (meal.strMealThumb ?? '').isNotEmpty ? meal.strMealThumb! : null;

            final ingredients = <Map<String, String?>>[
              {'ingredient': meal.strIngredient1, 'measure': meal.strMeasure1},
              {'ingredient': meal.strIngredient2, 'measure': meal.strMeasure2},
              {'ingredient': meal.strIngredient3, 'measure': meal.strMeasure3},
              {'ingredient': meal.strIngredient4, 'measure': meal.strMeasure4},
              {'ingredient': meal.strIngredient5, 'measure': meal.strMeasure5},
              // add more entries if your model has them (strIngredient6..)
            ].where((e) {
              final ing = e['ingredient'];
              return ing != null && ing.trim().isNotEmpty;
            }).toList();

            return RefreshIndicator(
              onRefresh: () async {
                await context.read<MealsDetailsCubit>().loadMealsDetails(mealId);
              },
              child: CustomScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    expandedHeight: 300,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: imageUrl != null
                          ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(child: CircularProgressIndicator(strokeWidth: 2));
                        },
                        errorBuilder: (context, error, stackTrace) =>
                        const Center(child: Icon(Icons.broken_image, size: 100)),
                      )
                          : const Center(child: Icon(Icons.broken_image, size: 100)),
                    ),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            meal.strMeal ?? 'Unknown Meal',
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),

                          Row(
                            children: [
                              Chip(
                                label: Text(
                                  meal.strCategory?.isNotEmpty == true ? meal.strCategory! : '—',
                                  style: const TextStyle(color: Colors.white, fontSize: 12),
                                ),
                                backgroundColor: Colors.orange,
                                padding: const EdgeInsets.all(4),
                              ),
                              const SizedBox(width: 8),
                              Chip(
                                label: Text(
                                  meal.strArea?.isNotEmpty == true ? meal.strArea! : '—',
                                  style: const TextStyle(color: Colors.white, fontSize: 12),
                                ),
                                backgroundColor: Colors.blueGrey,
                                padding: const EdgeInsets.all(4),
                              ),
                            ],
                          ),

                          const Divider(height: 40),

                          const Text(
                            'Ingredients',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),

                          // Use ListView (shrinkWrapped) of ListTiles for ingredients
                          if (ingredients.isEmpty)
                            const Text('No ingredients available.')
                          else
                            ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: ingredients.length,
                              separatorBuilder: (_, __) => const SizedBox(height: 6),
                              itemBuilder: (context, idx) {
                                final item = ingredients[idx];
                                final ing = item['ingredient'] ?? '';
                                final measure = item['measure'] ?? '';
                                return ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: const Icon(Icons.check_circle, color: Colors.green, size: 20),
                                  title: Text(
                                    '${measure.isNotEmpty ? "$measure " : ""}$ing',
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                );
                              },
                            ),

                          const Divider(height: 40),
                          const Text(
                            'Instructions',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            meal.strInstructions ?? 'No instructions available.',
                            style: const TextStyle(fontSize: 16, height: 1.6),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return const Center(child: Text("Waiting for data..."));
        },
      ),
    );
  }
  Widget _buildErrorUI(BuildContext context, String message, String id) {
    return Center(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, color: Colors.red, size: 60),
            const SizedBox(height: 16),
            Text("Error: ${message.isNotEmpty ? message : 'Unknown error'}", textAlign: TextAlign.center),
            const SizedBox(height: 8),
            Text("Meal ID: $id", style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.read<MealsDetailsCubit>().loadMealsDetails(id),
              child: const Text("Try Again"),
            ),
          ],
        ),
      ),
    );
  }

}