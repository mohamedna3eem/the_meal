import 'package:flutter/material.dart';
import 'package:the_meal/core/router/routes_name.dart';
import 'package:the_meal/domain/entites/meals_entity.dart';

class MealsCard extends StatelessWidget {
  final String imageUrl;
  final String mealId;
  final MealsEntity meal;

   const MealsCard({super.key, required this.imageUrl, required this.mealId,required this.meal});


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
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
  }
}
