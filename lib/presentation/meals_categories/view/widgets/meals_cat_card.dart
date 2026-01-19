import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_meal/core/router/routes_name.dart';
import 'package:the_meal/domain/entites/meal_cat_response_entity.dart';

class MealsCatCard extends StatelessWidget {
  final CategoriesEntity category;

  const MealsCatCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            RouteNames.mealsScreen,
            arguments: category.strCategory,
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
                  category.strCategoryThumb,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                  const Icon(Icons.fastfood, size: 50),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                category.strCategory,
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
  }
}
