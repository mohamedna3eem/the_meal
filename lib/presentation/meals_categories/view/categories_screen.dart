import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:the_meal/core/loading/loading_widgit.dart';
import 'package:the_meal/presentation/meals_categories/view/widgets/meals_cat_card.dart';
import 'package:the_meal/presentation/meals_categories/view_model/categories_states.dart';
import 'package:the_meal/presentation/meals_categories/view_model/categories_view_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("meal_categories".tr), centerTitle: true),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          final cubit = context.read<CategoriesCubit>();
          final categories = cubit.categories;
          return LoadingWidget(
            loadingState: cubit.loading,
            onRetry: () => cubit.loadCategories(),
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return MealsCatCard(category: category);
              },
            ),
          );
        },
      ),
    );
  }
}
