import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_meal/core/loading/loading_widgit.dart';
import 'package:the_meal/core/router/routes_name.dart';
import 'package:the_meal/presentation/meals_categories/view_model/categories_states.dart';
import 'package:the_meal/presentation/meals_categories/view_model/categories_view_model.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meal Categories'), centerTitle: true),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          final cubit = context.read<CategoriesCubit>();
            final categories = cubit.categories;

            return LoadingWidget(loadingState:cubit.loading,
                onRetry:() => cubit.loadCategories(),
                child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: categories?.length,
              itemBuilder: (context, index) {
                final category = categories?[index];
                return Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.mealsScreen,
                        arguments: category!.strCategory,
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                            child: Image.network(
                              category?.strCategoryThumb ?? "",
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                              const Icon(Icons.fastfood, size: 50),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            category?.strCategory ?? 'Unknown',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ));
        },
      ),
    );
  }
}