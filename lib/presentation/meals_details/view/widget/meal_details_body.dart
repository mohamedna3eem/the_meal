import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_meal/domain/entites/meals_details_response_entity.dart';

class MealDetailsBody extends StatelessWidget {
  final String imageUrl;
  final MealsDetailsEntity? meal;

  const MealDetailsBody({
    super.key,
    required this.imageUrl,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Image.network(imageUrl, fit: BoxFit.cover),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal?.strMeal ?? "",
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(height: 40),
                Text(
                  '_ingredients'.tr,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: meal?.ingredients.length ?? 0,
                  separatorBuilder: (_, __) => const SizedBox(height: 6),
                  itemBuilder: (_, i) {
                    final ingredients = meal?.ingredients;
                    final item = ingredients?[i];
                    return ListTile(
                      leading: const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      title: Text('${item?['measure']} ${item?['ingredient']}'),
                    );
                  },
                ),
                const Divider(height: 40),
                Text(meal?.strMeal ?? ""),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
